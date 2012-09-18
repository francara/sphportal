package sph.domain.cliente

class ClienteContratoCCusto {

  Cliente cliente
  Contrato contrato
  CentroDeCusto ccusto
  Logotipo logotipo
  
  static constraints = {
    logotipo blank:true, nullable:true
  }
  
  static mapping = {
    table "CLIENTE_CONTRATO_CCUSTO"
    id column: 'ID_CLIENTE_CONTRATO_CCUSTO', generator:'sequence', params:[sequence:'SEQ_CLIENTE_CONTRATO_CCUSTO']
  }
}
