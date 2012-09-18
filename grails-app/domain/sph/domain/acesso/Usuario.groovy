package sph.domain.acesso

class Usuario {
  String nome
  String password
  Boolean admin

  GrupoAcesso grupo
  
  Boolean admin() { admin }
  
  static constraints = {
    nome blank:false, nullable:false, unique:true
    password blank:false, nullable:false, password:true
  }
  static mapping = {
    id column: "ID_USUARIO", generator:'sequence', params:[sequence:'SEQ_USUARIO']
    // MODEL: Usuario: criar [DS_NOME]
    nome column: "DS_NOME"
    // MODEL: Usuario: criar [DS_PASSWORD]
    password column: "DS_PASSWORD"
    // MODEL: Usuario: criar FL_ADMIN
    admin column: "FL_ADMIN"
    grupo lazy:false
  }

}
