package sph.domain.cliente.grade

import java.util.ArrayList
import java.util.List

import org.springframework.dao.DataIntegrityViolationException

class GradeDiaController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def addIntervalo() {
    def idInteralo = params.intervaloHora
    def intervaloInstance = IntervaloHora.get(idInteralo)
    def gradeDiaInstance = GradeDia.get(params.id)

    gradeDiaInstance.addToIntervalos(new DiaSemanaIntervalo(intervaloInstance))
        
    if (!gradeDiaInstance.save(flush: true)) {
      redirect(action: "edit", id: params.id)
      return
    }
    
    redirect(action: "edit", id: params.id)
  }
    
  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [gradeDiaInstanceList: GradeDia.list(params), gradeDiaInstanceTotal: GradeDia.count()]
  }

  def create() {
    [gradeDiaInstance: new GradeDia(params),
          conversation: params.conversation,
          backcontroller: params.backcontroller, backaction: params.backaction, backid: params.backid]
  }

  def save() {
    def gradeDiaInstance = new GradeDia(params)
    if (!gradeDiaInstance.save(flush: true)) {
      render(view: "create", model: [gradeDiaInstance: gradeDiaInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'gradeDia.label', default: 'GradeDia'),
      gradeDiaInstance.id
    ])
    if (params.conversation) {
      redirect(controller: params.backcontroller, action: params.backaction, id: params.backid)
    } else {
      redirect(action: "edit", id: gradeDiaInstance.id)
    }
  }

  def show() {
    def gradeDiaInstance = GradeDia.get(params.id)
    if (!gradeDiaInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [gradeDiaInstance: gradeDiaInstance]
  }

  def edit() {
    def gradeDiaInstance = GradeDia.get(params.id)
    if (!gradeDiaInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      redirect(action: "list")
      return
    }
    List<IntervaloHora> intervalos = new ArrayList()
    gradeDiaInstance.intervalos.each{
      intervalos.add(it.intervalo)
    }

    /*
    * Seleciona apenas as gradeDia que não estão associas a GradeHoras
    */
   def exclusiveIntervalosList =  IntervaloHora.findAll("        \
     from IntervaloHora as intervalo                        \
     where                                                  \
         not exists(                                        \
             from GradeDia as grade                         \
               join grade.intervalos as grade_intervalo     \
             where                                          \
               grade = ?                                    \
               and grade_intervalo.intervalo = intervalo    \
     )", [gradeDiaInstance])
    
    [ gradeDiaInstance: gradeDiaInstance, intervaloInstanceList: intervalos, 
      exclusiveIntervalosList: exclusiveIntervalosList,
      conversation: params.conversation,
      backcontroller: params.backcontroller, backaction: params.backaction, backid: params.backid
    ]
  }

  def update() {
    def gradeDiaInstance = GradeDia.get(params.id)
    if (!gradeDiaInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (gradeDiaInstance.version > version) {
        gradeDiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'gradeDia.label', default: 'GradeDia')]
            as Object[],
            "Another user has updated this GradeDia while you were editing")
        render(view: "edit", model: [gradeDiaInstance: gradeDiaInstance])
        return
      }
    }

    gradeDiaInstance.properties = params

    if (!gradeDiaInstance.save(flush: true)) {
      render(view: "edit", model: [gradeDiaInstance: gradeDiaInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'gradeDia.label', default: 'GradeDia'),
      gradeDiaInstance.id
    ])

    if (params.conversation) {
      redirect(controller: params.backcontroller, action: params.backaction, id: params.backid)
    } else {
      redirect(action: "show", id: gradeDiaInstance.id)
    }
  }

  def delete() {
    def gradeDiaInstance = GradeDia.get(params.id)
    if (!gradeDiaInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      gradeDiaInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      if (params.conversation) {
        redirect(controller: params.backcontroller, action: params.backaction, id: params.backid)
      } else {
        redirect(action: "list")
      }
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'gradeDia.label', default: 'GradeDia'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
