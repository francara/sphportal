package sph.domain.cliente

import sph.domain.Pessoa
import sph.util.Cnpj
import sph.util.Cpf

class Contato extends Pessoa {
  String departamento
  static belongsTo = [cliente:Cliente]
  List fones
  static hasMany = [fones: Fone]

  def cpf() {
    if (this.cpf == null) return new Cnpj()
    else return new Cpf(this.cpf.toString())
  }
  
  def _cpf(String cpfStr) {
    Cpf oCpf = new Cpf(cpfStr)
    this.cpf = oCpf.toInteger()
  }
  
  static constraints = {
    departamento blank: true, nullable: true
  }

  static mapping = {
    discriminator value: "1"
    id column: "ID_CONTATO", generator:'sequence', params:[sequence:'SEQ_CONTATO']
    // MODEL: Contato: departamento [DS_DEPARTAMENTO], retirar tabela DEPARTAMENTO
    // MODEL: Contato: extends Pessoa. Remover tabela CLIENTE_CONTATO
    departamento column: "DS_DEPARTAMENTO"
    fones cascade:"all-delete-orphan" 
  }
}
