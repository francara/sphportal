package sph.controller.basico

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.basico.Uf;

class UfController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["GET","POST"]]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [ufInstanceList: Uf.list(params), ufInstanceTotal: Uf.count()]
  }

  def create() {
    [ufInstance: new Uf(params)]
  }

  def save() {
    def ufInstance = new Uf(params)
    if (!ufInstance.save(flush: true)) {
      render(view: "create", model: [ufInstance: ufInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'uf.label', default: 'Uf'),
      ufInstance.id
    ])
    redirect(action: "show", id: ufInstance.id)
  }

  def show() {
    def ufInstance = Uf.get(params.id)
    if (!ufInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [ufInstance: ufInstance]
  }

  def edit() {
    def ufInstance = Uf.get(params.id)
    if (!ufInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [ufInstance: ufInstance]
  }

  def update() {
    def ufInstance = Uf.get(params.id)
    if (!ufInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (ufInstance.version > version) {
        ufInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'uf.label', default: 'Uf')]
            as Object[],
            "Another user has updated this Uf while you were editing")
        render(view: "edit", model: [ufInstance: ufInstance])
        return
      }
    }

    ufInstance.properties = params

    if (!ufInstance.save(flush: true)) {
      render(view: "edit", model: [ufInstance: ufInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'uf.label', default: 'Uf'),
      ufInstance.id
    ])
    redirect(action: "show", id: ufInstance.id)
  }

  def delete() {
    def ufInstance = Uf.get(params.id)
    if (!ufInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      ufInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'uf.label', default: 'Uf'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
