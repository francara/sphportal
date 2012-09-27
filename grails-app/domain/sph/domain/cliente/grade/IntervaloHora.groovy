package sph.domain.cliente.grade

import org.joda.time.LocalTime
import org.jadira.usertype.dateandtime.joda.*

class IntervaloHora {

  LocalTime horaInicio
  LocalTime horaFim
  Double percentualExtra
  
  public String toString() {
    horaInicio.format("HH:mm") + " - " + horaFim.format("HH:mm")
  }
  
  static constraints = {
  }
  static mapping = {
    table "INTERVALO_HORA"
    id column: 'ID_INTERVALO_HORA', generator:'sequence', params:[sequence:'SEQ_INTERVALO_HORA']
    horaInicio column: "HORA_INICIO"
    horaFim column: "HORA_FIM"
    percentualExtra column: "PERCENTUAL_EXTRA"
  }
}
