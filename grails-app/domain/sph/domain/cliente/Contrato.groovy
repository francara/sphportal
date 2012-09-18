package sph.domain.cliente

import org.joda.time.LocalDate

class Contrato {
  String descricao
  LocalDate dataInicio
  Boolean ativo
  
  Cliente cliente
  
  static hasMany = [vigencias: ContratoVigencia, slas: ContratoServico, contratoCCustos:ClienteContratoCCusto]

  def ccustos = {
    Set<CentroDeCusto> ccustosSet = new HashSet<CentroDeCusto>()
    contratoCCustos.each {
      ccustosSet.add(it.ccusto)
    }
    return ccustosSet
  }
  
  ContratoVigencia getContratoVigente() {
    def vigente = ContratoVigencia.findByContratoAndDataTerminoIsNull(this)
    // TODO: Contrato - Percorrer lista de vigencias
    if (vigente == null) {
      vigente = ContratoVigencia.findAllByContrato(this,  [sort: "dataInicio", order: "desc"]).get(0)
    }
    return vigente
  }

  static constraints = {
  }

  static mapping = {
    id column: "ID_CONTRATO", generator:'sequence', params:[sequence:'SEQ_CONTRATO']
    descricao column: 'DS_CONTRATO'
    dataInicio column: "DT_INICIO_CONTRATO"
    contratoCCustos column: 'ID_CONTRATO'
    ativo column: 'FL_ATIVO'
  }
}
