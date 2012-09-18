<%@ page import="sph.domain.acesso.GrupoAcesso"%>

<div class="fieldcontain ${hasErrors(bean: grupoAcessoInstance, field: 'nome', 'error')} ">
    <label for="nome"> <g:message code="grupoAcesso.nome.label" default="Nome" />
    </label>
    <g:textField name="nome" value="${grupoAcessoInstance?.nome}" />    
</div>

