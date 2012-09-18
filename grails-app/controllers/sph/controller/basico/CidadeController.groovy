package sph.controller.basico

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.basico.Cidade;
import sph.domain.basico.Uf;

class CidadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def listarPorUf() {
      def uf = Uf.get(params.uf)
      def cidades = Cidade.findAllByUf(uf)
      render(template: 'cidadeSelect', model: [cidadeInstanceList: cidades]) 
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cidadeInstanceList: Cidade.list(params), cidadeInstanceTotal: Cidade.count()]
    }

    def create() {
        [cidadeInstance: new Cidade(params)]
    }

    def save() {
        def cidadeInstance = new Cidade(params)
        if (!cidadeInstance.save(flush: true)) {
            render(view: "create", model: [cidadeInstance: cidadeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cidade.label', default: 'Cidade'), cidadeInstance.id])
        redirect(action: "show", id: cidadeInstance.id)
    }

    def show() {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "list")
            return
        }

        [cidadeInstance: cidadeInstance]
    }

    def edit() {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "list")
            return
        }

        [cidadeInstance: cidadeInstance]
    }

    def update() {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cidadeInstance.version > version) {
                cidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cidade.label', default: 'Cidade')] as Object[],
                          "Another user has updated this Cidade while you were editing")
                render(view: "edit", model: [cidadeInstance: cidadeInstance])
                return
            }
        }

        cidadeInstance.properties = params

        if (!cidadeInstance.save(flush: true)) {
            render(view: "edit", model: [cidadeInstance: cidadeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cidade.label', default: 'Cidade'), cidadeInstance.id])
        redirect(action: "show", id: cidadeInstance.id)
    }

    def delete() {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cidadeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
