package sph.domain.cliente

class Fone {
  Integer ddd
  Integer telefone
  FoneType tipo
  static belongsTo = [ contato:Contato ]

  transient boolean deleted
  static transients = ['deleted']

  static constraints = {
    ddd(blank:false, nullable:true)
    telefone(blank:false)
    tipo(blank:false, inList:FoneType.list(), minSize:1, maxSize:1)
  }
  
  static mapping = {
    // MODEL: Telefone: criar nova tabela. Substituir cliente_contato_fone
    table "TELEFONE"
    id column: "ID_TELEFONE", generator:'sequence', params:[sequence:'SEQ_TELEFONE']
    ddd column: "NR_DDD"
    telefone column: "NR_TELEFONE"
    tipo column: "DS_TIPO"
  }

  def String toString() {
    return "${telefone} - ${tipo}"
  }

  enum FoneType {
    RESIDENCIAL, COMERCIAL, CELULAR

    String toString(){
      name()
    }
    String getKey(){
      name()
    }
    static list() {
      [
        RESIDENCIAL,
        COMERCIAL,
        CELULAR
      ]
    }
  } // FoneType

}
