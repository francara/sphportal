<%@ page import="sph.domain.cliente.Contrato"%>
<script language="javascript" >
$().ready(function() {    
      $('#dataInicio').setMask('date')                  
});
</script>

<div class="grid_8 alpha fieldcontain ${hasErrors(bean: contratoInstance, field: 'cliente', 'error')} required">
    <label for="cliente"> <g:message code="contrato.cliente.label" default="Cliente" /> 
        <span class="required-indicator">*</span>
    </label>
    <g:select id="cliente" name="cliente.id" from="${sph.domain.cliente.Cliente.list()}" required="" autofocus=""
        optionKey="id" optionValue="nomeFantasia" style="width:180px"
        value="${contratoInstance?.cliente?.id}" class="many-to-one" />
</div>

<div class="grid_7 omega fieldcontain ${hasErrors(bean: contratoInstance, field: 'descricao', 'error')} ">
    <label for="descricao"> <g:message code="contrato.descricao.label" default="Descricao" />
    </label>
    <g:textField name="descricao" value="${contratoInstance?.descricao}" />
</div>

<div class="clear"></div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoInstance, field: 'dataInicio', 'error')} ">
    <label for="dataInicio"> Data Inicio
    </label>
    <g:textField name="dataInicio" value="${contratoInstance?.dataInicio.format('dd/MM/yyyy')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: feriadoInstance, field: 'ativo', 'error')} ">
  <label for="ativo">Ativo</label>
  <g:checkBox name="ativo" value="${contratoInstance?.ativo}" />
</div>
