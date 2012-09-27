package sph.domain.basico

class Cidade {

  String descricao
  String codigo
  Uf uf
  
  static def allByUf(Uf uf) {
    if (uf == null) return Cidade.list()
    else return Cidade.findAllByUf(uf)
  }
  
  static constraints = {
    codigo size: 0..20
    descricao blank:false, nullable:false, unique:true, size: 0..20
  }
  
  static mapping = {
    id column: "ID_CIDADE", generator:'sequence', params:[sequence:'SEQ_CIDADE']
    descricao column: "DS_CIDADE"
    codigo column: "CD_MUNICIPIO"
  }
}
