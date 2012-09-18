<%@ page import="sph.domain.basico.Uf" %>



<div class="fieldcontain ${hasErrors(bean: ufInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="uf.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${ufInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ufInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="uf.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${ufInstance?.descricao}"/>
</div>

