package sph.controller.acesso

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.acesso.Permissao;

class PermissaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [permissaoInstanceList: Permissao.list(params), permissaoInstanceTotal: Permissao.count()]
    }

    def create() {
        [permissaoInstance: new Permissao(params)]
    }

    def save() {
        def permissaoInstance = new Permissao(params)
        if (!permissaoInstance.save(flush: true)) {
            render(view: "create", model: [permissaoInstance: permissaoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'permissao.label', default: 'Permissao'), permissaoInstance.id])
        redirect(action: "show", id: permissaoInstance.id)
    }

    def show() {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "list")
            return
        }

        [permissaoInstance: permissaoInstance]
    }

    def edit() {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "list")
            return
        }

        [permissaoInstance: permissaoInstance]
    }

    def update() {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (permissaoInstance.version > version) {
                permissaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'permissao.label', default: 'Permissao')] as Object[],
                          "Another user has updated this Permissao while you were editing")
                render(view: "edit", model: [permissaoInstance: permissaoInstance])
                return
            }
        }

        permissaoInstance.properties = params

        if (!permissaoInstance.save(flush: true)) {
            render(view: "edit", model: [permissaoInstance: permissaoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'permissao.label', default: 'Permissao'), permissaoInstance.id])
        redirect(action: "show", id: permissaoInstance.id)
    }

    def delete() {
        def permissaoInstance = Permissao.get(params.id)
        if (!permissaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "list")
            return
        }

        try {
            permissaoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'permissao.label', default: 'Permissao'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
