<%@ page import="sph.domain.acesso.Usuario"%>
<%@ page import="sph.domain.acesso.GrupoAcesso"%>

<div class="grid_16">
<div
	class="grid_4 alpha fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
	<label for="nome"> <g:message code="usuario.nome.label"
			default="Nome" />

	</label>
	<g:textField name="nome" value="${usuarioInstance?.nome}" />
</div>

<div
	class="grid_4 fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
	<label for="password"> <g:message code="usuario.password.label"
			default="Password" />

	</label>
	<g:textField name="password" value="${usuarioInstance?.password}" />
</div>

<div class="grid_2 fieldcontain ${hasErrors(bean: usuarioInstance, field: 'admin', 'error')} ">
  <label for="admin">
    Admin    
  </label>
  <g:checkBox name="admin" value="${usuarioInstance?.admin}" />
</div>


<div
  class="grid_4 omega fieldcontain ${hasErrors(bean: usuarioInstance, field: 'grupo', 'error')} required">
  <label for="grupo"> <g:message code="usuario.grupo.label"
      default="Grupo" /> <span class="required-indicator">*</span>
  </label>
  <g:select name="grupo.id" from="${GrupoAcesso.list()}" required=""
    optionValue="nome" optionKey="id"  class="many-to-one"
    value="${usuarioInstance?.grupo?.id}" />
</div>

<div class="clear"></div>
</div>
