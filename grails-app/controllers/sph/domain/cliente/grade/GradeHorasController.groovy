package sph.domain.cliente.grade

import org.joda.time.LocalTime;
import org.springframework.dao.DataIntegrityViolationException

class GradeHorasController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def index() {
    redirect(action: "list", params: params)
  }

  def addGradeDia() {
    def idGradeDia = params.gradeDia
    def gradeHorasInstance = GradeHoras.get(params.id)
    def gradeDiaInstance = GradeDia.get(idGradeDia)
    gradeHorasInstance.addToDias(new GradeHorasDia(gradeDiaInstance))
    if (!gradeHorasInstance.save(flush: true)) {
      render(view: "edit", model: [gradeHorasInstance: gradeHorasInstance])
      return
    }
    
    redirect(action: "edit", id: params.id)
  }
  
  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [gradeHorasInstanceList: GradeHoras.list(params), gradeHorasInstanceTotal: GradeHoras.count()]
  }

  def create() {
    [gradeHorasInstance: new GradeHoras(params)]
  }

  def save() {
    def gradeHorasInstance = new GradeHoras(params)
    if (!gradeHorasInstance.save(flush: true)) {
      render(view: "create", model: [gradeHorasInstance: gradeHorasInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'gradeHoras.label', default: 'GradeHoras'),
      gradeHorasInstance.id
    ])
    redirect(action: "show", id: gradeHorasInstance.id)
  }

  def show() {
    def gradeHorasInstance = GradeHoras.get(params.id)
    if (!gradeHorasInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [gradeHorasInstance: gradeHorasInstance, gradeHorasItemList: itensGradeHoras(gradeHorasInstance)]
  }

  def edit() {
    def gradeHorasInstance = GradeHoras.get(params.id)
    if (!gradeHorasInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    /*
     * Seleciona apenas as gradeDia que não estão associas a GradeHoras 
     */
    def gradeDiasList =  GradeDia.findAll("from GradeDia as dia \
    where                             \
       not exists(                       \
        from GradeHoras as grade       \
            join grade.dias as grade_dia \
        where                           \
          grade.id = ?                  \
          and grade_dia.gradeDia = dia \
      )", [gradeHorasInstance.id])
    
    List itens = itensGradeHoras(gradeHorasInstance)
    [gradeHorasInstance: gradeHorasInstance, gradeHorasItemList: itens, gradeDiasList: gradeDiasList]
  }

  private List<GradeHorasItem> itensGradeHoras(GradeHoras grade) {
    List itens = new ArrayList<GradeHorasItem>()
    grade.dias.each {
      GradeDia dia = it.gradeDia
      if (!dia.intervalos) itens.add(new GradeHorasItem(dia))

      dia.intervalos.each {
        IntervaloHora intervalo = it.intervalo
        itens.add(new GradeHorasItem(dia, intervalo))
      }
    }
    return itens
  }
  
  def update() {
    def gradeHorasInstance = GradeHoras.get(params.id)
    if (!gradeHorasInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (gradeHorasInstance.version > version) {
        gradeHorasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'gradeHoras.label', default: 'GradeHoras')]
            as Object[],
            "Another user has updated this GradeHoras while you were editing")
        render(view: "edit", model: [gradeHorasInstance: gradeHorasInstance])
        return
      }
    }

    gradeHorasInstance.properties = params

    if (!gradeHorasInstance.save(flush: true)) {
      render(view: "edit", model: [gradeHorasInstance: gradeHorasInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'gradeHoras.label', default: 'GradeHoras'),
      gradeHorasInstance.id
    ])
    redirect(action: "show", id: gradeHorasInstance.id)
  }

  def delete() {
    def gradeHorasInstance = GradeHoras.get(params.id)
    if (!gradeHorasInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      gradeHorasInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'gradeHoras.label', default: 'GradeHoras'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}

class GradeHorasItem {
  Long id
  String descricao  
  LocalTime horaInicio
  LocalTime horaFim
  Boolean diaUtil
  Double percentualExtra

  public GradeHorasItem(GradeDia dia) {
    this.id = dia.id
    this.descricao = dia.descricao
    this.diaUtil = dia.diaUtil
  }
  
  public GradeHorasItem(GradeDia dia, IntervaloHora intervalo) {
    this.id = dia.id
    this.descricao = dia.descricao
    this.horaInicio = intervalo.horaInicio
    this.horaFim = intervalo.horaFim
    this.diaUtil = dia.diaUtil
    this.percentualExtra = intervalo.percentualExtra
  }
  
}
