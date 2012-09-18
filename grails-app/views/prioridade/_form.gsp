<%@ page import="sph.domain.cliente.Prioridade" %>



<div class="fieldcontain ${hasErrors(bean: prioridadeInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="prioridade.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${prioridadeInstance?.descricao}"/>
</div>

