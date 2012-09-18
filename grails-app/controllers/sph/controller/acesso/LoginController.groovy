package sph.controller.acesso

import sph.domain.acesso.Usuario;

class LoginController {

  def login() {
    def u = Usuario.findByNome(params.username)
    if (u) {
      if (u.password == params.password) {
        session.usuario = u
        session.login = null
        render(view:"/sphindex")
      }
      else {
        session.login = [message : "Senha inválida."]
        render(view:"/sphindex")
      }
    }
    else {
        session.login = [message: "Usuário não localizado."]
        render(view:"/sphindex")
    }
  }
  
  def logout() {
    session.usuario = null
    session.login = null
    render(view:"/sphindex")
  }
}
