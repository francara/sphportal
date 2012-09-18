package sph.domain.cliente.grade

class DiaSemanaIntervalo {

  static belongsTo = [dia : GradeDia] 
  IntervaloHora intervalo
  
  DiaSemanaIntervalo(IntervaloHora intervalo) {
    this.intervalo = intervalo
  }
  
  static constraints = {
  }
  static mapping = {
    table "DIA_SEMANA_INTERVALO"
    id column: 'ID_DIA_SEMANA_INTERVALO', generator:'sequence', params:[sequence:'SEQ_DIA_SEMANA_INTERVALO']
    dia column: 'ID_GRADE_DIA'
    intervalo column: 'ID_INTERVALO_HORA'
  }
}
