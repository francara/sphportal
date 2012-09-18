<%@ page import="sph.domain.basico.Feriado" %>
<resource:include components="dateChooser"  />

<div class="fieldcontain ${hasErrors(bean: feriadoInstance, field: 'data', 'error')} required">
  <label for="data">
    <g:message code="feriado.data.label" default="Data" />
    <span class="required-indicator">*</span>
  </label>
  <!-- <datePicker name="data" precision="day"  value="${feriadoInstance?.data}"  /> -->
  <!--richui:dateChooser id="data" name="data" format="dd/MM/yyyy" /-->    
  <g:textField name="data" value="${feriadoInstance?.data.format('dd/MM/yyyy')}" />
</div>
<script language="javascript" >
$().ready(function() {    
      $('#data').setMask('date')
});
</script>

<div class="fieldcontain ${hasErrors(bean: feriadoInstance, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="feriado.cidade.label" default="Cidade" />
	</label>
	<g:select id="cidade" name="cidade.id" from="${sph.domain.basico.Cidade.list()}" optionKey="id" optionValue="descricao"  value="${feriadoInstance?.cidade?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: feriadoInstance, field: 'uf', 'error')} ">
	<label for="uf">
		<g:message code="feriado.uf.label" default="Uf" />
	</label>
	<g:select id="uf" name="uf.id" from="${sph.domain.basico.Uf.list()}" 
      optionKey="id" optionValue="descricao"  value="${feriadoInstance?.uf?.id}"
      class="many-to-one" noSelection="['null': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: feriadoInstance, field: 'nacional', 'error')} ">
	<label for="nacional">
		<g:message code="feriado.nacional.label" default="Nacional" />
		
	</label>
	<g:checkBox name="nacional" value="${feriadoInstance?.nacional}" />
</div>

