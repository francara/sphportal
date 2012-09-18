package sph.controller.basico

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.cliente.Prioridade;

class PrioridadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [prioridadeInstanceList: Prioridade.list(params), prioridadeInstanceTotal: Prioridade.count()]
    }

    def create() {
        [prioridadeInstance: new Prioridade(params)]
    }

    def save() {
        def prioridadeInstance = new Prioridade(params)
        if (!prioridadeInstance.save(flush: true)) {
            render(view: "create", model: [prioridadeInstance: prioridadeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), prioridadeInstance.id])
        redirect(action: "show", id: prioridadeInstance.id)
    }

    def show() {
        def prioridadeInstance = Prioridade.get(params.id)
        if (!prioridadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "list")
            return
        }

        [prioridadeInstance: prioridadeInstance]
    }

    def edit() {
        def prioridadeInstance = Prioridade.get(params.id)
        if (!prioridadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "list")
            return
        }

        [prioridadeInstance: prioridadeInstance]
    }

    def update() {
        def prioridadeInstance = Prioridade.get(params.id)
        if (!prioridadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (prioridadeInstance.version > version) {
                prioridadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prioridade.label', default: 'Prioridade')] as Object[],
                          "Another user has updated this Prioridade while you were editing")
                render(view: "edit", model: [prioridadeInstance: prioridadeInstance])
                return
            }
        }

        prioridadeInstance.properties = params

        if (!prioridadeInstance.save(flush: true)) {
            render(view: "edit", model: [prioridadeInstance: prioridadeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), prioridadeInstance.id])
        redirect(action: "show", id: prioridadeInstance.id)
    }

    def delete() {
        def prioridadeInstance = Prioridade.get(params.id)
        if (!prioridadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "list")
            return
        }

        try {
            prioridadeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prioridade.label', default: 'Prioridade'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
