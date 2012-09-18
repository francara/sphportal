package sph.domain.cliente

class CentroDeCusto {

  String codigo
  
  static constraints = {
    codigo blank:false, nullable:false, unique:true
  }
  
  static mapping = {
    table "CENTRO_CUSTO"
    id column: 'ID_CENTRO_CUSTO', generator:'sequence', params:[sequence:'SEQ_CENTRO_CUSTO']
    // MODEL: CCusto inserir [DS_CCUSTO]
    codigo column: "DS_CCUSTO"
  }
}
