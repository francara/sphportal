package sph.controller.cliente

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.cliente.ContratoVigencia;

class ContratoVigenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contratoVigenciaInstanceList: ContratoVigencia.list(params), contratoVigenciaInstanceTotal: ContratoVigencia.count()]
    }

    def create() {
        [contratoVigenciaInstance: new ContratoVigencia(params)]
    }

    def save() {
        def contratoVigenciaInstance = new ContratoVigencia(params)
        if (!contratoVigenciaInstance.save(flush: true)) {
            render(view: "create", model: [contratoVigenciaInstance: contratoVigenciaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), contratoVigenciaInstance.id])
        redirect(action: "show", id: contratoVigenciaInstance.id)
    }

    def show() {
        def contratoVigenciaInstance = ContratoVigencia.get(params.id)
        if (!contratoVigenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "list")
            return
        }

        [contratoVigenciaInstance: contratoVigenciaInstance]
    }

    def edit() {
        def contratoVigenciaInstance = ContratoVigencia.get(params.id)
        if (!contratoVigenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "list")
            return
        }

        [contratoVigenciaInstance: contratoVigenciaInstance]
    }

    def update() {
        def contratoVigenciaInstance = ContratoVigencia.get(params.id)
        if (!contratoVigenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contratoVigenciaInstance.version > version) {
                contratoVigenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contratoVigencia.label', default: 'ContratoVigencia')] as Object[],
                          "Another user has updated this ContratoVigencia while you were editing")
                render(view: "edit", model: [contratoVigenciaInstance: contratoVigenciaInstance])
                return
            }
        }

        contratoVigenciaInstance.properties = params

        if (!contratoVigenciaInstance.save(flush: true)) {
            render(view: "edit", model: [contratoVigenciaInstance: contratoVigenciaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), contratoVigenciaInstance.id])
        redirect(action: "show", id: contratoVigenciaInstance.id)
    }

    def delete() {
        def contratoVigenciaInstance = ContratoVigencia.get(params.id)
        if (!contratoVigenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contratoVigenciaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contratoVigencia.label', default: 'ContratoVigencia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
