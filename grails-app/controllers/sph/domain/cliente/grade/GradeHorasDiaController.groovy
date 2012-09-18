package sph.domain.cliente.grade

import org.springframework.dao.DataIntegrityViolationException

class GradeHorasDiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gradeHorasDiaInstanceList: GradeHorasDia.list(params), gradeHorasDiaInstanceTotal: GradeHorasDia.count()]
    }

    def create() {
        [gradeHorasDiaInstance: new GradeHorasDia(params)]
    }

    def save() {
        def gradeHorasDiaInstance = new GradeHorasDia(params)
        if (!gradeHorasDiaInstance.save(flush: true)) {
            render(view: "create", model: [gradeHorasDiaInstance: gradeHorasDiaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), gradeHorasDiaInstance.id])
        redirect(action: "show", id: gradeHorasDiaInstance.id)
    }

    def show() {
        def gradeHorasDiaInstance = GradeHorasDia.get(params.id)
        if (!gradeHorasDiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "list")
            return
        }

        [gradeHorasDiaInstance: gradeHorasDiaInstance]
    }

    def edit() {
        def gradeHorasDiaInstance = GradeHorasDia.get(params.id)
        if (!gradeHorasDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "list")
            return
        }

        [gradeHorasDiaInstance: gradeHorasDiaInstance]
    }

    def update() {
        def gradeHorasDiaInstance = GradeHorasDia.get(params.id)
        if (!gradeHorasDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (gradeHorasDiaInstance.version > version) {
                gradeHorasDiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia')] as Object[],
                          "Another user has updated this GradeHorasDia while you were editing")
                render(view: "edit", model: [gradeHorasDiaInstance: gradeHorasDiaInstance])
                return
            }
        }

        gradeHorasDiaInstance.properties = params

        if (!gradeHorasDiaInstance.save(flush: true)) {
            render(view: "edit", model: [gradeHorasDiaInstance: gradeHorasDiaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), gradeHorasDiaInstance.id])
        redirect(action: "show", id: gradeHorasDiaInstance.id)
    }

    def delete() {
        def gradeHorasDiaInstance = GradeHorasDia.get(params.id)
        if (!gradeHorasDiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            gradeHorasDiaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gradeHorasDia.label', default: 'GradeHorasDia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
