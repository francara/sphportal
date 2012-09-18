package sph.domain.cliente

class Logotipo {
  String descricao

  static constraints = {
  }
  
  static mapping = {
    id column: "ID_LOGOTIPO", generator:'sequence', params:[sequence:'SEQ_LOGOTIPO']
    descricao column: "DS_LOGOTIPO"
  }
}
