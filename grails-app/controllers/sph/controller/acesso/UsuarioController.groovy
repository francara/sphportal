package sph.controller.acesso

import org.springframework.dao.DataIntegrityViolationException

import sph.domain.acesso.Usuario;
import sph.domain.acesso.UsuarioEnum;

class UsuarioController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    def usuarios = Usuario.list(params)
    render(view: "/acesso/usuario/list", model: [usuarioInstanceList: usuarios, usuarioInstanceTotal: Usuario.count()])
  }

  def create() {
    render(view: "/acesso/usuario/create", model:[usuarioInstance: new Usuario(params)])
  }

  def save() {
    def usuarioInstance = new Usuario(params)
    if (usuarioInstance.admin && !session?.usuario.admin) {
      flash.message = "Apenas usuarios ADMIN podem criar outro ADMIN"
      render(view: "/acesso/usuario/create", model: [usuarioInstance: usuarioInstance])
      return
    }
    if (!usuarioInstance.save(flush: true)) {
      render(view: "/acesso/usuario/create", model: [usuarioInstance: usuarioInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'usuario.label', default: 'Usuario'),
      usuarioInstance.id
    ])
    redirect(action: "show", id: usuarioInstance.id)
  }

  def show() {
    def usuarioInstance = Usuario.get(params.id)
    if (!usuarioInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    render(view: "/acesso/usuario/edit", model:[usuarioInstance: usuarioInstance])
  }

  def edit() {
    def usuarioInstance = Usuario.get(params.id)
    if (!usuarioInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    render(view: "/acesso/usuario/edit", model:[usuarioInstance: usuarioInstance])
  }

  def update() {
    def usuarioInstance = Usuario.get(params.id)
    if (!usuarioInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (usuarioInstance.version > version) {
        usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'usuario.label', default: 'Usuario')]
            as Object[],
            "Another user has updated this Usuario while you were editing")
        render(view: "/acesso/usuario/edit", model: [usuarioInstance: usuarioInstance])
        return
      }
    }

    usuarioInstance.properties = params

    if (!usuarioInstance.save(flush: true)) {
      render(view: "/acesso/usuario/edit", model: [usuarioInstance: usuarioInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'usuario.label', default: 'Usuario'),
      usuarioInstance.id
    ])
    redirect(action: "show", id: usuarioInstance.id)
  }

  def delete() {
    def usuarioInstance = Usuario.get(params.id)
    if (!usuarioInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      usuarioInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'usuario.label', default: 'Usuario'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
