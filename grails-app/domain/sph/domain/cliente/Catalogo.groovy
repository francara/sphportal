package sph.domain.cliente

class Catalogo {

  String descricao
  
  static constraints = {
  }
  
  static mapping = {
    id column: "ID_CATALOGO", generator:'sequence', params:[sequence:'SEQ_CATALOGO']
    descricao column: "DS_CATALOGO"
  }
}
