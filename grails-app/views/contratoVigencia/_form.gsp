<%@ page import="sph.domain.cliente.ContratoVigencia" %>

<script language="javascript" >
$().ready(function() {    
    $('#valor').setMask('decimal-us')
    $('#qtHoras').setMask('integer')
    $('#qtTickets').setMask('integer')
    $('#margem').setMask('integer')    
    $('#dtIni').setMask('date')
    $('#dtFim').setMask('date')
    $('#dtAss').setMask('date')  
});
</script>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataInicio', 'error')} required">
  <label for="dataInicio">
    <g:message code="contratoVigencia.dataInicio.label" default="Dt Ini" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField id="dtIni" name="dataInicio" value="${contratoVigenciaInstance?.dataInicio?.format('dd/MM/yyyy')}" />   
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataTermino', 'error')} ">
	<label for="dataTermino">
		<g:message code="contratoVigencia.dataTermino.label" default="Dt Term" />
	</label> <br>
  <g:textField id="dtFim" name="dataTermino" value="${contratoVigenciaInstance?.dataTermino?.format('dd/MM/yyyy')}" /> 
</div>

<div class="clear"></div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'valor', 'error')} required">
  <label for="valor">
    <g:message code="contratoVigencia.valor.label" default="Valor" />
    <span class="required-indicator">*</span>
  </label>
  <g:field type="number" id="valor" name="valor" required="" value="${fieldValue(bean: contratoVigenciaInstance, field: 'valor')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'qtTickets', 'error')} ">
	<label for="qtTickets">
		<g:message code="contratoVigencia.qtTickets.label" default="Qt Tickets" />
	</label>
	<g:field type="number" name="qtTickets" value="${fieldValue(bean: contratoVigenciaInstance, field: 'qtTickets')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'numeroAditivo', 'error')} ">
	<label for="numeroAditivo">
		<g:message code="contratoVigencia.numeroAditivo.label" default="Numero Aditivo" />
		
	</label>
	<g:field type="number" name="numeroAditivo" value="${fieldValue(bean: contratoVigenciaInstance, field: 'numeroAditivo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'contrato', 'error')} required">
	<label for="contrato">
		<g:message code="contratoVigencia.contrato.label" default="Contrato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contrato" name="contrato.id" from="${sph.domain.cliente.Contrato.list()}" optionKey="id" required="" value="${contratoVigenciaInstance?.contrato?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataAssinatura', 'error')} required">
	<label for="dataAssinatura">
		<g:message code="contratoVigencia.dataAssinatura.label" default="Data Assinatura" />
		<span class="required-indicator">*</span>
	</label>
  <g:textField id="dtAss" name="dataAssinatura" value="${contratoVigenciaInstance?.dataAssinatura.format('dd/MM/yyyy')}" />       
</div>


<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'horaAberta', 'error')} ">
	<label for="horaAberta">
		<g:message code="contratoVigencia.horaAberta.label" default="Hora Aberta" />
		
	</label>
	<g:checkBox name="horaAberta" value="${contratoVigenciaInstance?.horaAberta}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'margemFatExtra', 'error')} required">
	<label for="margemFatExtra">
		<g:message code="contratoVigencia.margemFatExtra.label" default="Margem Fat Extra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="margemFatExtra" required="" value="${fieldValue(bean: contratoVigenciaInstance, field: 'margemFatExtra')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'qtHoras', 'error')} required">
	<label for="qtHoras">
		<g:message code="contratoVigencia.qtHoras.label" default="Qt Horas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="qtHoras" required="" value="${fieldValue(bean: contratoVigenciaInstance, field: 'qtHoras')}"/>
</div>


