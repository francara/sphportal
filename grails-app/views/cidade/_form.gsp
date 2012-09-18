<%@ page import="sph.domain.basico.Cidade" %>

<div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="cidade.descricao.label" default="Descricao" />
		
	</label>
	<g:field name="descricao" value="${cidadeInstance?.descricao}" type="text" required="" />
</div>

<div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'codigo', 'error')} ">
  <label for="codigo">
    <g:message code="cidade.codigo.label" default="Codigo" />
    
  </label>
  <g:field name="codigo" value="${cidadeInstance?.codigo}" type="text" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cidadeInstance, field: 'uf', 'error')} required">
	<label for="uf">
		<g:message code="cidade.uf.label" default="Uf" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uf" name="uf.id" from="${sph.domain.basico.Uf.list()}" optionKey="id" required="" value="${cidadeInstance?.uf?.id}" optionValue="codigo" class="many-to-one"/>
</div>

