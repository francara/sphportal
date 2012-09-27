package sph.domain.basico

class Cep {
  Integer codigo
  
  String logradouro
  Cidade cidade

  @Override
  String toString() {
    String str = codigo.toString();
    int delta = 8 - str.length();
    for(int i=0; i<delta; i++) str = "0$str"
    str.substring(0, 5) + "-" + str.substring(5, 8)
  }
  
  static constraints = {
    codigo blank:false, nullable:false, unique:true, validator: { val, obj -> if (val.toString().length() != 8) return  ['invalid.cep'] }
    logradouro size:0..20
  }
  
  static mapping = {
    id column: "ID_CEP", generator:'sequence', params:[sequence:'SEQ_CEP']
    codigo column: "CD_CEP"
    logradouro column: "DS_ENDERECO"
  }
}
