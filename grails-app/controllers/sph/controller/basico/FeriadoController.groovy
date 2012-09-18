package sph.controller.basico

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.basico.Feriado;

class FeriadoController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [feriadoInstanceList: Feriado.list(params), feriadoInstanceTotal: Feriado.count()]
  }

  def create() {
    [feriadoInstance: new Feriado(params)]
  }

  def save() {
    def feriadoInstance = new Feriado(params)
    if (!feriadoInstance.save(flush: true)) {
      render(view: "create", model: [feriadoInstance: feriadoInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'feriado.label', default: 'Feriado'),
      feriadoInstance.id
    ])
    redirect(action: "show", id: feriadoInstance.id)
  }

  def show() {
    def feriadoInstance = Feriado.get(params.id)
    if (!feriadoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [feriadoInstance: feriadoInstance]
  }

  def edit() {
    def feriadoInstance = Feriado.get(params.id)
    if (!feriadoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [feriadoInstance: feriadoInstance]
  }

  def update() {
    def feriadoInstance = Feriado.get(params.id)
    if (!feriadoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (feriadoInstance.version > version) {
        feriadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'feriado.label', default: 'Feriado')]
            as Object[],
            "Another user has updated this Feriado while you were editing")
        render(view: "edit", model: [feriadoInstance: feriadoInstance])
        return
      }
    }

    feriadoInstance.properties = params

    if (!feriadoInstance.save(flush: true)) {
      render(view: "edit", model: [feriadoInstance: feriadoInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'feriado.label', default: 'Feriado'),
      feriadoInstance.id
    ])
    redirect(action: "show", id: feriadoInstance.id)
  }

  def delete() {
    def feriadoInstance = Feriado.get(params.id)
    if (!feriadoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      feriadoInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'feriado.label', default: 'Feriado'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
