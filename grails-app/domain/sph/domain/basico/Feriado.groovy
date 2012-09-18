package sph.domain.basico

import org.joda.time.LocalDate

class Feriado {

  LocalDate data
  Boolean nacional
  
  Cidade cidade
  Uf uf
  
  static constraints = {
    cidade nullable:true, validator: {val, obj -> if (val == null && !obj.nacional) return "feriado.cidadevazia.nacional"}
    uf nullable:true
  }
  
  static mapping = {
    id column: "ID_FERIADO", generator:'sequence', params:[sequence:'SEQ_FERIADO']
    data column: "DT_FERIADO"
    // MODEL: Feriado [FL_NACIONAL] criar.
    nacional column: "FL_NACIONAL"
  }
}
