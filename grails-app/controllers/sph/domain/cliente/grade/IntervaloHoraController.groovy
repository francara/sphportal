package sph.domain.cliente.grade

import org.springframework.dao.DataIntegrityViolationException

class IntervaloHoraController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [intervaloHoraInstanceList: IntervaloHora.list(params), intervaloHoraInstanceTotal: IntervaloHora.count()]
  }

  def create() {
    if (params.conversation && params.conversation == "1") {
      [intervaloHoraInstance: new IntervaloHora(params),
        conversation: params.conversation,
        backcontroller: params.backcontroller, backaction: params.backaction, backid: params.backid
      ]
    } else {
      [intervaloHoraInstance: new IntervaloHora(params)]
    }
  }

  def save() {
    def intervaloHoraInstance = new IntervaloHora(params)
    if (!intervaloHoraInstance.save(flush: true)) {
      render(view: "create", model: [intervaloHoraInstance: intervaloHoraInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'intervaloHora.label', default: 'IntervaloHora'),
      intervaloHoraInstance.id
    ])
    
    if (params.conversation) {
      redirect(controller: params.backcontroller, action: params.backaction, id: params.backid)
    } else {
      redirect(action: "edit", id: intervaloHoraInstance.id)
    }
  }

  def show() {
    def intervaloHoraInstance = IntervaloHora.get(params.id)
    if (!intervaloHoraInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [intervaloHoraInstance: intervaloHoraInstance,
          conversation: params.conversation,
          backcontroller: params.backcontroller, backaction: params.backaction, backid: params.backid
        ]
  }

  def edit() {
    def intervaloHoraInstance = IntervaloHora.get(params.id)
    if (!intervaloHoraInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [ intervaloHoraInstance: intervaloHoraInstance,
          conversation: params.conversation,
          backcontroller: params.backcontroller, backaction: params.backaction, backid: params.backid
        ]
  }

  def update() {
    def intervaloHoraInstance = IntervaloHora.get(params.id)
    if (!intervaloHoraInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (intervaloHoraInstance.version > version) {
        intervaloHoraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'intervaloHora.label', default: 'IntervaloHora')]
            as Object[],
            "Another user has updated this IntervaloHora while you were editing")
        render(view: "edit", model: [intervaloHoraInstance: intervaloHoraInstance])
        return
      }
    }

    intervaloHoraInstance.properties = params

    if (!intervaloHoraInstance.save(flush: true)) {
      render(view: "edit", model: [intervaloHoraInstance: intervaloHoraInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'intervaloHora.label', default: 'IntervaloHora'),
      intervaloHoraInstance.id
    ])
    
    if (params.conversation) {
      redirect(controller: params.backcontroller, action: params.backaction, id: params.backid)
    } else {
      redirect(action: "show", id: intervaloHoraInstance.id)
    }
  }

  def delete() {
    def intervaloHoraInstance = IntervaloHora.get(params.id)
    if (!intervaloHoraInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      intervaloHoraInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'intervaloHora.label', default: 'IntervaloHora'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
