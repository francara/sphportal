package sph.domain.basico

class Cep {
  Integer codigo
  
  String logradouro
  Cidade cidade

  static constraints = {
    codigo blank:false, nullable:false, unique:true
  }
  
  static mapping = {
    id column: "ID_CEP", generator:'sequence', params:[sequence:'SEQ_CEP']
    codigo column: "CD_CEP"
    logradouro column: "DS_ENDERECO"
  }
}
