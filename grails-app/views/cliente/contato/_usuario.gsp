<%@ page import="sph.domain.acesso.Usuario"%>
<%@ page import="sph.domain.acesso.GrupoAcesso"%>

<fieldset class="form">
    <legend>Criar Usuário</legend>
    <div class="grid_4">
        <label for="nome"> <g:message code="usuario.nome.label" default="Nome" />
        </label>
        <g:textField name="usuario.nome" value="${usuarioInstance?.nome}" />
    </div>

    <div class="grid_4">
        <label for="password"> <g:message code="usuario.password.label" default="Password" />
        </label>
        <g:textField name="usuario.password" value="${usuarioInstance?.password}" />
    </div>

    <div class="grid_4">
        <label for="tipo"> <g:message code="usuario.tipo.label" default="Tipo" /> <span class="required-indicator">*</span>
        </label>
        <g:select name="usuario.tipo" from="${sph.domain.acesso.UsuarioEnum?.values()}"
            keys="${sph.domain.acesso.UsuarioEnum.values()*.name()}" required="" value="${usuarioInstance?.tipo?.name()}" />
    </div>

    <div class="grid_4">
        <label for="grupo"> <g:message code="usuario.grupo.label" default="Grupo" /> <span class="required-indicator">*</span>
        </label>
        <g:select name="usuario.grupo.id" from="${GrupoAcesso.list()}" required="" optionValue="nome" optionKey="id" class="many-to-one"
            value="${usuarioInstance?.grupo?.id}" />
    </div>

</fieldset>
