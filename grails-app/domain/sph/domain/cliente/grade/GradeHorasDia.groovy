package sph.domain.cliente.grade

class GradeHorasDia {

  static belongsTo = [grade : GradeHoras]
  GradeDia gradeDia
  
  GradeHorasDia(GradeDia dia) {
    this.gradeDia = dia
  }
  
  static constraints = {
  }
  static mapping = {
    table "GRADE_HORAS_DIA"
    id column: 'ID_GRADE_HORAS_DIA', generator:'sequence', params:[sequence:'SEQ_GRADE_HORAS_DIA']
    grade column: 'ID_GRADE_HORAS'
    gradeDia column: 'ID_GRADE_DIA'
  }
}
