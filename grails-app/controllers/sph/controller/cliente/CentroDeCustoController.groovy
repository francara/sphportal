package sph.controller.cliente

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.cliente.CentroDeCusto;

class CentroDeCustoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [centroDeCustoInstanceList: CentroDeCusto.list(params), centroDeCustoInstanceTotal: CentroDeCusto.count()]
    }

    def create() {
        [centroDeCustoInstance: new CentroDeCusto(params)]
    }

    def save() {
        def centroDeCustoInstance = new CentroDeCusto(params)
        if (!centroDeCustoInstance.save(flush: true)) {
            render(view: "create", model: [centroDeCustoInstance: centroDeCustoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), centroDeCustoInstance.id])
        redirect(action: "show", id: centroDeCustoInstance.id)
    }

    def show() {
        def centroDeCustoInstance = CentroDeCusto.get(params.id)
        if (!centroDeCustoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "list")
            return
        }

        [centroDeCustoInstance: centroDeCustoInstance]
    }

    def edit() {
        def centroDeCustoInstance = CentroDeCusto.get(params.id)
        if (!centroDeCustoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "list")
            return
        }

        [centroDeCustoInstance: centroDeCustoInstance]
    }

    def update() {
        def centroDeCustoInstance = CentroDeCusto.get(params.id)
        if (!centroDeCustoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (centroDeCustoInstance.version > version) {
                centroDeCustoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'centroDeCusto.label', default: 'CentroDeCusto')] as Object[],
                          "Another user has updated this CentroDeCusto while you were editing")
                render(view: "edit", model: [centroDeCustoInstance: centroDeCustoInstance])
                return
            }
        }

        centroDeCustoInstance.properties = params

        if (!centroDeCustoInstance.save(flush: true)) {
            render(view: "edit", model: [centroDeCustoInstance: centroDeCustoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), centroDeCustoInstance.id])
        redirect(action: "show", id: centroDeCustoInstance.id)
    }

    def delete() {
        def centroDeCustoInstance = CentroDeCusto.get(params.id)
        if (!centroDeCustoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            centroDeCustoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'centroDeCusto.label', default: 'CentroDeCusto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
