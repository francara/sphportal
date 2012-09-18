package sph.domain.cliente

class PrazoAtendimento {

  Integer qtMinutosAtendimento
  Boolean prazoIndeterminado
  
  public String toString() {
    qtMinutosAtendimento + " (min) - Indeterminado: " + prazoIndeterminado
  }
  
  static mapping = {
    table "PRAZO_ATENDIMENTO"
    id column: "ID_PRAZO_ATENDIMENTO", generator:'sequence', params:[sequence:'SEQ_PRAZO_ATENDIMENTO']
    qtMinutosAtendimento column: "QT_MINUTOS_ATENDIMENTO"
    prazoIndeterminado column: "FL_PRAZO_INDETERMINADO"
  }
}
