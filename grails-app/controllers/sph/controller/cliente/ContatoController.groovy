package sph.controller.cliente

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.acesso.Usuario
import sph.domain.cliente.Contato;

// VIEW: Contato - Campos do grid
class ContatoController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    render(view: "/cliente/contato/list", model: [contatoInstanceList: Contato.list(params), contatoInstanceTotal: Contato.count()])
  }

  def create() {
    render(view: "/cliente/contato/create", model: [contatoInstance: new Contato(params)])
  }

  def createUsuario() {
    render(template:"/cliente/contato/usuario")
  }
  
  def save() {
    def contatoInstance = new Contato(params)
    contatoInstance._cpf(params.cpf)
    if (!contatoInstance.save(flush: true)) {
      render(view: "/cliente/contato/create", model: [contatoInstance: contatoInstance])
      return
    }

    if (params.usuario) {
      def usuarioInstance = new Usuario(params.usuario)
      usuarioInstance.save(flush:true)
    }
    
    flash.message = message(code: 'default.created.message', args: [
      message(code: 'contato.label', default: 'Contato'),
      contatoInstance.id
    ])
    redirect(action: "show", id: contatoInstance.id)
  }

  def show() {
    def contatoInstance = Contato.get(params.id)
    if (!contatoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    render(view: "/cliente/contato/show", model: [contatoInstance: contatoInstance])
  }

  def edit() {
    def contatoInstance = Contato.get(params.id)
    if (!contatoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    render(view: "/cliente/contato/edit", model: [contatoInstance: contatoInstance])
  }

  def update() {
    def contatoInstance = Contato.get(params.id)
    contatoInstance._cpf(params.cpf)
    if (!contatoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (contatoInstance.version > version) {
        contatoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'contato.label', default: 'Contato')]
            as Object[],
            "Another user has updated this Contato while you were editing")
        render(view: "/cliente/contato/edit", model: [contatoInstance: contatoInstance])
        return
      }
    }

    contatoInstance.properties = params
    // find the phones that are marked for deletion
    def _toBeDeleted = contatoInstance.fones.findAll {(it?.deleted || (it == null))}

    // if there are phones to be deleted remove them all
    if (_toBeDeleted) {
      contatoInstance.fones.removeAll(_toBeDeleted)
    }

    if (!contatoInstance.save(flush: true)) {
      render(view: "/cliente/contato/edit", model: [contatoInstance: contatoInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'contato.label', default: 'Contato'),
      contatoInstance.id
    ])
    redirect(action: "show", id: contatoInstance.id)
  }

  def delete() {
    def contatoInstance = Contato.get(params.id)
    if (!contatoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      contatoInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'contato.label', default: 'Contato'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
