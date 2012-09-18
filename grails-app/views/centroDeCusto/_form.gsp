<%@ page import="sph.domain.cliente.CentroDeCusto" %>



<div class="fieldcontain ${hasErrors(bean: centroDeCustoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="centroDeCusto.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${centroDeCustoInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: centroDeCustoInstance, field: 'contratos', 'error')} ">
	<label for="contratos">
		<g:message code="centroDeCusto.contratos.label" default="Contratos" />
		
	</label>
	
</div>

