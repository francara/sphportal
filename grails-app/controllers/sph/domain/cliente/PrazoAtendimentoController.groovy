package sph.domain.cliente

import org.springframework.dao.DataIntegrityViolationException

class PrazoAtendimentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [prazoAtendimentoInstanceList: PrazoAtendimento.list(params), prazoAtendimentoInstanceTotal: PrazoAtendimento.count()]
    }

    def create() {
        [prazoAtendimentoInstance: new PrazoAtendimento(params)]
    }

    def save() {
        def prazoAtendimentoInstance = new PrazoAtendimento(params)
        if (!prazoAtendimentoInstance.save(flush: true)) {
            render(view: "create", model: [prazoAtendimentoInstance: prazoAtendimentoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), prazoAtendimentoInstance.id])
        redirect(action: "show", id: prazoAtendimentoInstance.id)
    }

    def show() {
        def prazoAtendimentoInstance = PrazoAtendimento.get(params.id)
        if (!prazoAtendimentoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "list")
            return
        }

        [prazoAtendimentoInstance: prazoAtendimentoInstance]
    }

    def edit() {
        def prazoAtendimentoInstance = PrazoAtendimento.get(params.id)
        if (!prazoAtendimentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "list")
            return
        }

        [prazoAtendimentoInstance: prazoAtendimentoInstance]
    }

    def update() {
        def prazoAtendimentoInstance = PrazoAtendimento.get(params.id)
        if (!prazoAtendimentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (prazoAtendimentoInstance.version > version) {
                prazoAtendimentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento')] as Object[],
                          "Another user has updated this PrazoAtendimento while you were editing")
                render(view: "edit", model: [prazoAtendimentoInstance: prazoAtendimentoInstance])
                return
            }
        }

        prazoAtendimentoInstance.properties = params

        if (!prazoAtendimentoInstance.save(flush: true)) {
            render(view: "edit", model: [prazoAtendimentoInstance: prazoAtendimentoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), prazoAtendimentoInstance.id])
        redirect(action: "show", id: prazoAtendimentoInstance.id)
    }

    def delete() {
        def prazoAtendimentoInstance = PrazoAtendimento.get(params.id)
        if (!prazoAtendimentoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "list")
            return
        }

        try {
            prazoAtendimentoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
