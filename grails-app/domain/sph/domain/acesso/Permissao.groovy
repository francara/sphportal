package sph.domain.acesso

class Permissao {
  String codigo
  Date dataInclusao
  GrupoAcesso grupo  
  
  PermissaoEnum toEnum() { PermissaoEnum.valueOf(codigo) }
  
  static Permissao create(PermissaoEnum eperm) {
    return new Permissao(codigo: eperm.toString(), dataInclusao: new Date())
  }
  
  static mapping = {
    id column: "ID_PERMISSAO", generator:'sequence', params:[sequence:'SEQ_PERMISSAO']
    codigo column: "CD_PERMISSAO", length: 30
  }
}
