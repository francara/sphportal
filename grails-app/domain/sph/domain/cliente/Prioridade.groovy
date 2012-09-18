package sph.domain.cliente

class Prioridade {

  String descricao
  
  public String toString() {
    descricao
  }
  
  static constraints = {
    descricao blank:false, nullable: false, unique: true
  }
  
  static mapping = {
    id column: 'ID_PRIORIDADE', generator:'sequence', params:[sequence:'SEQ_PRIORIDADE']
    descricao column: "DS_PRIORIDADE"
  }
}
