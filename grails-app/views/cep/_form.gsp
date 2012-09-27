<%@ page import="sph.domain.basico.Cep" %>

<div class="fieldcontain ${hasErrors(bean: cepInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="cep.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="codigo" required="" value="${fieldValue(bean: cepInstance, field: 'codigo')}"/>
</div>
<script language="javascript" >
$().ready(function() {    
      $('#codigo').setMask('cep')
});
</script>

<div class="fieldcontain ${hasErrors(bean: cepInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="cep.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
  <g:select id="cidade" name="cidade.id" from="${sph.domain.basico.Cidade.list()}" optionKey="id" optionValue="descricao"  value="${cepInstance?.cidade?.id}" class="many-to-one" noSelection="['null': '']"/>
    
</div>

<div class="fieldcontain ${hasErrors(bean: cepInstance, field: 'logradouro', 'error')} ">
	<label for="logradouro">
		<g:message code="cep.logradouro.label" default="Logradouro" />
		
	</label>
	<g:textField name="logradouro" value="${cepInstance?.logradouro}"/>
</div>

