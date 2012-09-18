package sph.domain.cliente.grade

class GradeHoras {
  String descricao
  static hasMany = [dias : GradeHorasDia]
    
  static constraints = {
  }
  static mapping = {
    table "GRADE_HORAS"
    id column: 'ID_GRADE_HORAS', generator:'sequence', params:[sequence:'SEQ_GRADE_HORAS']
    descricao column: "DS_GRADE_HORAS"
    dias column: 'ID_GRADE_HORAS'
  }
}
