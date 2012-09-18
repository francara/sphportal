package sph.domain.acesso

import java.util.Iterator;

import org.apache.log4j.Logger

class GrupoAcesso {
  private static final Logger logger = Logger.getLogger(GrupoAcesso.class)

  String nome
  transient Map<PermissaoEnum, Permissao> epermissoes = new HashMap<PermissaoEnum, Permissao>()

  Boolean contem(PermissaoEnum permissao) {
    return epermissoes.containsKey(permissao)
  }

  void bind(List<PermissaoEnum> eperms) {
    def avaliado = new HashSet<PermissaoEnum>()
    eperms.each {
      avaliado.add(it)
      // Insere uma nova permissao
      if (!epermissoes.containsKey(it)) {
        this.addToPermissoes(Permissao.create(it))
      }
    }
    
    def removable = new ArrayList()
    permissoes.each{permissao ->
      if (!avaliado.contains(permissao.toEnum())) {
        removable.add(permissao)
        permissao.delete()
      }
    }
    permissoes.removeAll(removable)
  }

  static hasMany = [permissoes: Permissao]
  static transients = ['epermissoes']
  static constraints = {
    nome blank:false, nullable:false, unique:true
  }
  static mapping = {
    id column: "ID_GRUPO_ACESSO", generator:'sequence', params:[sequence:'SEQ_GRUPO_ACESSO']
    nome column: "nome", length: 45
    permissoes lazy: false
  }
  
  def afterLoad() {
    for (Permissao permissao : permissoes) {
      epermissoes.put(PermissaoEnum.valueOf(permissao.codigo), permissao)
    }
  }
  
}
