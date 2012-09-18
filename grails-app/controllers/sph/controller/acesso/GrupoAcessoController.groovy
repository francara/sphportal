package sph.controller.acesso

import org.springframework.dao.DataIntegrityViolationException

import sph.controller.AbstractController
import sph.domain.acesso.GrupoAcesso;
import sph.domain.acesso.Permissao;
import sph.domain.acesso.PermissaoEnum
import sph.domain.acesso.Usuario

class GrupoAcessoController extends AbstractController {

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    def grupos = GrupoAcesso.list(params)
    render(view: "/acesso/grupo/list", model:[grupoAcessoInstanceList: grupos, grupoAcessoInstanceTotal: GrupoAcesso.count()])
  }

  def create() {
    render(view: "/acesso/grupo/create", model:[grupoAcessoInstance: new GrupoAcesso(params)])
  }

  def save() {
    def grupoAcessoInstance = new GrupoAcesso(params)
    /*
     * Tratamento de listas de permissoes.
     */
    def permissoes =
        concat(
        params.list("permissoesAdministrativoLst"),
        params.list("permissoesCadastrosBasicosLst"),
        params.list("permissoesClienteLst"),
        params.list("permissoesConsultorLst"),
        params.list("permissoesRiscoLst"),
        params.list("permissoesRelatoriosLst")
        )
    permissoes.each {
      grupoAcessoInstance.addToPermissoes(new Permissao(codigo: PermissaoEnum.valueOf(it).toString(), dataInclusao: new Date()))
    }
    if (!grupoAcessoInstance.save(flush: true)) {
      render(view: "/acesso/grupo/create", model: [grupoAcessoInstance: grupoAcessoInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
      grupoAcessoInstance.id
    ])
    redirect(action: "show", id: grupoAcessoInstance.id)
  }

  def show() {
    def grupoAcessoInstance = GrupoAcesso.get(params.id)
    handleInstance(params, grupoAcessoInstance)

    render(view: "/acesso/grupo/show", model:[grupoAcessoInstance: grupoAcessoInstance, controller:"grupo", action: "show"])
  }

  def edit() {
    def grupoAcessoInstance = GrupoAcesso.get(params.id)
    handleInstance(params, grupoAcessoInstance)

    render(view: "/acesso/grupo/edit", model:[grupoAcessoInstance: grupoAcessoInstance])
  }

  def update() {
    def grupoAcessoInstance = GrupoAcesso.get(params.id)
    /*
     * Tratamento de listas de permissoes.
     */
    def permissoes = permBind(
        concat(
        params.list("permissoesAdministrativoLst"),
        params.list("permissoesCadastrosBasicosLst"),
        params.list("permissoesClienteLst"),
        params.list("permissoesConsultorLst"),
        params.list("permissoesRiscoLst"),
        params.list("permissoesRelatoriosLst")
        ))
    grupoAcessoInstance.bind(permissoes)

    handleInstance(params, grupoAcessoInstance)

    if (params.version) {
      def version = params.version.toLong()
      if (grupoAcessoInstance.version > version) {
        grupoAcessoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'grupoAcesso.label', default: 'GrupoAcesso')]
            as Object[],
            "Another user has updated this GrupoAcesso while you were editing")
        render(view: "/acesso/grupo/edit", model: [grupoAcessoInstance: grupoAcessoInstance])
        return
      }
    }

    grupoAcessoInstance.properties = params

    if (!grupoAcessoInstance.save(flush: true)) {
      render(view: "/acesso/grupo/edit", model: [grupoAcessoInstance: grupoAcessoInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
      grupoAcessoInstance.id
    ])
    redirect(action: "show", id: grupoAcessoInstance.id)
  }

  def delete() {
    def grupoAcessoInstance = GrupoAcesso.get(params.id)
    if (!grupoAcessoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if(Usuario.countByGrupo(grupoAcessoInstance) > 0) {
      flash.message = "Não foi possível deletar Grupo de Acesso"
      redirect(action: "list")
      return
    }
    
    try {
      grupoAcessoInstance.delete(flush: true)
        flash.message = message(code: 'default.deleted.message', args: [
          message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
          params.id
      ])
    
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }

  private void handleInstance(params, instance) {
    if (!instance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'grupoAcesso.label', default: 'GrupoAcesso'),
        params.id
      ])
      redirect(action: "list")
      return
    }
  }

  private List<PermissaoEnum> concat(List<PermissaoEnum>... permissoes) {
    def permConcat = new ArrayList<PermissaoEnum>()
    for (List<PermissaoEnum> permLst : permissoes) {
      if (permLst != null) permConcat.addAll(permLst)
    }
    return permConcat;
  }

  private List<PermissaoEnum> permBind(List<String> permissoes) {
    def eperms = new ArrayList()
    permissoes.each {
      eperms.add( PermissaoEnum.valueOf(it) )
    }
    return eperms
  }
}
