<%@ page import="sph.domain.cliente.Catalogo" %>



<div class="fieldcontain ${hasErrors(bean: catalogoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="catalogo.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${catalogoInstance?.descricao}"/>
</div>

