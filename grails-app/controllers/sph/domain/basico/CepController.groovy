package sph.domain.basico

import org.springframework.dao.DataIntegrityViolationException

class CepController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cepInstanceList: Cep.list(params), cepInstanceTotal: Cep.count()]
    }

    def create() {
        [cepInstance: new Cep(params)]
    }

    def save() {
        def cepInstance = new Cep(params)
        if (!cepInstance.save(flush: true)) {
            render(view: "create", model: [cepInstance: cepInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cep.label', default: 'Cep'), cepInstance.id])
        redirect(action: "show", id: cepInstance.id)
    }

    def show() {
        def cepInstance = Cep.get(params.id)
        if (!cepInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "list")
            return
        }

        [cepInstance: cepInstance]
    }

    def edit() {
        def cepInstance = Cep.get(params.id)
        if (!cepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "list")
            return
        }

        [cepInstance: cepInstance]
    }

    def update() {
        def cepInstance = Cep.get(params.id)
        if (!cepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cepInstance.version > version) {
                cepInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cep.label', default: 'Cep')] as Object[],
                          "Another user has updated this Cep while you were editing")
                render(view: "edit", model: [cepInstance: cepInstance])
                return
            }
        }

        cepInstance.properties = params

        if (!cepInstance.save(flush: true)) {
            render(view: "edit", model: [cepInstance: cepInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cep.label', default: 'Cep'), cepInstance.id])
        redirect(action: "show", id: cepInstance.id)
    }

    def delete() {
        def cepInstance = Cep.get(params.id)
        if (!cepInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cepInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cep.label', default: 'Cep'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
