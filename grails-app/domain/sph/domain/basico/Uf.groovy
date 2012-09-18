package sph.domain.basico

import org.springframework.dao.DataIntegrityViolationException

class Uf {

  String codigo
  String descricao
  
  def beforeDelete() {
    if(Cidade.findByUf(this)) throw new DataIntegrityViolationException("Uf ${codigo} possui cidade associada.")
  }
  
  static constraints = {
    codigo blank:false, nullable: false, unique:true
  }
  
  static mapping = {
    id column: "ID_UF", generator:'sequence', params:[sequence:'SEQ_UF']
    codigo column: "CD_UF"
    descricao column: "DS_UF"
  }
}
