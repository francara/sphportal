package sph.domain.cliente

import org.joda.time.LocalDate


class ContratoVigencia implements Serializable {

  LocalDate dataInicio
  LocalDate dataTermino
  LocalDate dataAssinatura
  Integer qtHoras
  Integer qtTickets
  BigDecimal valor
  Integer margemFatExtra
  Boolean horaAberta
  Integer numeroAditivo
  
  static belongsTo = [contrato:Contrato]
  
  static constraints = {
    dataTermino(blank:true, nullable:true)
    qtTickets(blank:true, nullable:true)
    numeroAditivo(blank:true, nullable:true)
    margemFatExtra(blank:true, nullable:true)
  }
  
  static mapping = {
    table "CONTRATO_VIGENCIA"
    id column: "ID_CONTRATO_VIGENCIA", generator:'sequence', params:[sequence:'SEQ_CONTRATO_VIGENCIA']
    dataInicio column: "DT_INICIO_VIGENCIA"
    dataTermino column: "DT_TERMINO_VIGENCIA"
    dataAssinatura column: "DT_ASSINATURA_CONTRATO"
    qtHoras column: "QT_HORAS_CONTRATADAS"
    qtTickets column: "QT_TICKETS_CONTRATADOS"
    valor column: "VL_CONTRATO"
    margemFatExtra column: "MG_SUP_FAT_EXTRA"
    horaAberta column: "FL_CONTRATO_HORA_ABERTA"
    numeroAditivo column: "NR_ADITIVO_CONTRATUAL"
  }
}
