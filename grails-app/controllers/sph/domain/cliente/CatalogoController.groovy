package sph.domain.cliente

import org.springframework.dao.DataIntegrityViolationException

class CatalogoController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [catalogoInstanceList: Catalogo.list(params), catalogoInstanceTotal: Catalogo.count()]
    }

    def create() {
        [catalogoInstance: new Catalogo(params)]
    }

    def save() {
        def catalogoInstance = new Catalogo(params)
        if (!catalogoInstance.save(flush: true)) {
            render(view: "create", model: [catalogoInstance: catalogoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), catalogoInstance.id])
        redirect(action: "show", id: catalogoInstance.id)
    }

    def show() {
        def catalogoInstance = Catalogo.get(params.id)
        if (!catalogoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "list")
            return
        }

        [catalogoInstance: catalogoInstance]
    }

    def edit() {
        def catalogoInstance = Catalogo.get(params.id)
        if (!catalogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "list")
            return
        }

        [catalogoInstance: catalogoInstance]
    }

    def update() {
        def catalogoInstance = Catalogo.get(params.id)
        if (!catalogoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (catalogoInstance.version > version) {
                catalogoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'catalogo.label', default: 'Catalogo')] as Object[],
                          "Another user has updated this Catalogo while you were editing")
                render(view: "edit", model: [catalogoInstance: catalogoInstance])
                return
            }
        }

        catalogoInstance.properties = params

        if (!catalogoInstance.save(flush: true)) {
            render(view: "edit", model: [catalogoInstance: catalogoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), catalogoInstance.id])
        redirect(action: "show", id: catalogoInstance.id)
    }

    def delete() {
        def catalogoInstance = Catalogo.get(params.id)
        if (!catalogoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            catalogoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'catalogo.label', default: 'Catalogo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
