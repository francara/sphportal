package sph.domain.cliente.grade

import org.springframework.dao.DataIntegrityViolationException

class DiaSemanaIntervaloController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [diaSemanaIntervaloInstanceList: DiaSemanaIntervalo.list(params), diaSemanaIntervaloInstanceTotal: DiaSemanaIntervalo.count()]
    }

    def create() {
        [diaSemanaIntervaloInstance: new DiaSemanaIntervalo(params)]
    }

    def save() {
        def diaSemanaIntervaloInstance = new DiaSemanaIntervalo(params)
        if (!diaSemanaIntervaloInstance.save(flush: true)) {
            render(view: "create", model: [diaSemanaIntervaloInstance: diaSemanaIntervaloInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), diaSemanaIntervaloInstance.id])
        redirect(action: "show", id: diaSemanaIntervaloInstance.id)
    }

    def show() {
        def diaSemanaIntervaloInstance = DiaSemanaIntervalo.get(params.id)
        if (!diaSemanaIntervaloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "list")
            return
        }

        [diaSemanaIntervaloInstance: diaSemanaIntervaloInstance]
    }

    def edit() {
        def diaSemanaIntervaloInstance = DiaSemanaIntervalo.get(params.id)
        if (!diaSemanaIntervaloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "list")
            return
        }

        [diaSemanaIntervaloInstance: diaSemanaIntervaloInstance]
    }

    def update() {
        def diaSemanaIntervaloInstance = DiaSemanaIntervalo.get(params.id)
        if (!diaSemanaIntervaloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (diaSemanaIntervaloInstance.version > version) {
                diaSemanaIntervaloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo')] as Object[],
                          "Another user has updated this DiaSemanaIntervalo while you were editing")
                render(view: "edit", model: [diaSemanaIntervaloInstance: diaSemanaIntervaloInstance])
                return
            }
        }

        diaSemanaIntervaloInstance.properties = params

        if (!diaSemanaIntervaloInstance.save(flush: true)) {
            render(view: "edit", model: [diaSemanaIntervaloInstance: diaSemanaIntervaloInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), diaSemanaIntervaloInstance.id])
        redirect(action: "show", id: diaSemanaIntervaloInstance.id)
    }

    def delete() {
        def diaSemanaIntervaloInstance = DiaSemanaIntervalo.get(params.id)
        if (!diaSemanaIntervaloInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            diaSemanaIntervaloInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
