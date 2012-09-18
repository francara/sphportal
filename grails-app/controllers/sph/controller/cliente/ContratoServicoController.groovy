package sph.controller.cliente

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.cliente.ContratoServico;

class ContratoServicoController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [contratoServicoInstanceList: ContratoServico.list(params), contratoServicoInstanceTotal: ContratoServico.count()]
  }

  def create() {
    def model = [contratoServicoInstance: new ContratoServico(params)]
    if (params.returnToController) model["returnToController"] = params.returnToController
    return model
  }

  def save() {
    def contratoServicoInstance = new ContratoServico(params)
    if (!contratoServicoInstance.save(flush: true)) {
      render(view: "create", model: [contratoServicoInstance: contratoServicoInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'contratoServico.label', default: 'ContratoServico'),
      contratoServicoInstance.id
    ])
    
    if (params.returnToController) {
      redirect(controller: "contrato", action: "edit", id: contratoServicoInstance.contrato.id)
    } else {
      redirect(action: "show", id: contratoServicoInstance.id)
    }
  }

  def show() {
    def contratoServicoInstance = ContratoServico.get(params.id)
    if (!contratoServicoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [contratoServicoInstance: contratoServicoInstance]
  }

  def edit() {
    def contratoServicoInstance = ContratoServico.get(params.id)
    if (!contratoServicoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [contratoServicoInstance: contratoServicoInstance]
  }

  def update() {
    def contratoServicoInstance = ContratoServico.get(params.id)
    if (!contratoServicoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (contratoServicoInstance.version > version) {
        contratoServicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'contratoServico.label', default: 'ContratoServico')]
            as Object[],
            "Another user has updated this ContratoServico while you were editing")
        render(view: "edit", model: [contratoServicoInstance: contratoServicoInstance])
        return
      }
    }

    contratoServicoInstance.properties = params

    if (!contratoServicoInstance.save(flush: true)) {
      render(view: "edit", model: [contratoServicoInstance: contratoServicoInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'contratoServico.label', default: 'ContratoServico'),
      contratoServicoInstance.id
    ])
    redirect(action: "show", id: contratoServicoInstance.id)
  }

  def delete() {
    def contratoServicoInstance = ContratoServico.get(params.id)
    if (!contratoServicoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      contratoServicoInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'contratoServico.label', default: 'ContratoServico'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
