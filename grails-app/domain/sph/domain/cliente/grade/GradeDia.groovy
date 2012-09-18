package sph.domain.cliente.grade

class GradeDia {
  String descricao
  static hasMany = [intervalos : DiaSemanaIntervalo]
  Boolean diaUtil

  static constraints = {
  }
  
  static mapping = {
    table "GRADE_DIA"
    id column: 'ID_GRADE_DIA', generator:'sequence', params:[sequence:'SEQ_GRADE_DIA']
    descricao column: "DS_DIA_DA_SEMANA"
    diaUtil column: "FLAG_DIA_UTIL_NORMAL"
    intervalos column: 'ID_GRADE_DIA'
  }
}
