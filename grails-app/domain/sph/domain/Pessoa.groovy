package sph.domain

class Pessoa {
  String nome
  String apelido
  Long cpf
  String rg
  String email

  static constraints = {
    nome maxSize: 45
    apelido maxSize: 25, blank:true, nullable: true
    cpf maxSize: 11, blank:true, nullable: true
    rg maxSize: 25, blank:true, nullable: true
    email email:true
  }
  static mapping = {
    tablePerHierarchy false
    // MODEL: Pessoa: discriminator [CD_TP_PESSOA]
    discriminator column: "CD_TP_PESSOA", type: "integer"
    id column: 'ID_PESSOA'
    nome column: "DS_NOME"
    apelido column: "DS_APELIDO"
    cpf column: "CD_CPF"
    rg column: "CD_RG"
    email column: "EMAIL"
  }
}
