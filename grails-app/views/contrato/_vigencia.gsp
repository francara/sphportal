<%@ page import="sph.domain.cliente.ContratoVigencia" %>

<script language="javascript" >
$().ready(function() {    
      $('#valor').setMask('decimal')
      $('#qtHoras').setMask('integer')
      $('#qtTickets').setMask('integer')
      $('#margem').setMask('integer')
      $('#dtIni').setMask('date')      
      $('#dtFim').setMask('date')
      $('#dtAss').setMask('date')                  
});
</script>
<g:hiddenField type="number" name="contratoVigenciaInstance.id" value="${fieldValue(bean: contratoVigenciaInstance, field: 'id')}"/>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataInicio', 'error')} required">
  <label for="contratoVigenciaInstance.dataInicio">
    <g:message code="contratoVigencia.dataInicio.label" default="Inicio" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField id="dtIni" name="contratoVigenciaInstance.dataInicio" value="${contratoVigenciaInstance?.dataInicio?.format('dd/MM/yyyy')}" /> 
</div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataTermino', 'error')} ">
  <label for="contratoVigenciaInstance.dataTermino">
    <g:message code="contratoVigencia.dataTermino.label" default="Termino" />
  </label> <br>
  <g:textField id="dtFim" name="contratoVigenciaInstance.dataTermino" value="${contratoVigenciaInstance?.dataTermino?.format('dd/MM/yyyy')}" /> 
  
</div>
<div class="clear"></div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'valor', 'error')} required">
  <label for="contratoVigenciaInstance.valor">
    <g:message code="contratoVigencia.valor.label" default="Valor" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField  id="valor" name="contratoVigenciaInstance.valor" required="" value="${fieldValue(bean: contratoVigenciaInstance, field: 'valor')}"/>
</div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'qtTickets', 'error')} ">
  <label for="contratoVigenciaInstance.qtTickets">
    <g:message code="contratoVigencia.qtTickets.label" default="Qt Tickets" />
  </label>
  <g:field type="number" id="qtTickets" name="contratoVigenciaInstance.qtTickets" value="${fieldValue(bean: contratoVigenciaInstance, field: 'qtTickets')}"/>
</div>

<div class="clear"></div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'numeroAditivo', 'error')} ">
  <label for="numeroAditivo">
    <g:message code="contratoVigencia.numeroAditivo.label" default="Num Aditivo" />
    
  </label>
  <g:field type="number" name="contratoVigenciaInstance.numeroAditivo" value="${fieldValue(bean: contratoVigenciaInstance, field: 'numeroAditivo')}"/>
</div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'dataAssinatura', 'error')} required">
  <label for="dataAssinatura">
    <g:message code="contratoVigencia.dataAssinatura.label" default="Data Assinatura" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField id="dtAss" name="contratoVigenciaInstance.dataAssinatura" value="${contratoVigenciaInstance?.dataAssinatura?.format('dd/MM/yyyy')}" /> 
  
</div>
<div class="clear"></div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'horaAberta', 'error')} ">
  <label for="horaAberta">
    <g:message code="contratoVigencia.horaAberta.label" default="Hora Aberta" />
    
  </label>
  <g:checkBox name="contratoVigenciaInstance.horaAberta" value="${contratoVigenciaInstance?.horaAberta}" />
</div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'margemFatExtra', 'error')}">
  <label for="margemFatExtra">
    <g:message code="contratoVigencia.margemFatExtra.label" default="Margem" />
  </label>
  <g:field type="number" id="margem" name="contratoVigenciaInstance.margemFatExtra" value="${fieldValue(bean: contratoVigenciaInstance, field: 'margemFatExtra')}"/>
</div>
<div class="clear"></div>

<div class="grid_7 fieldcontain ${hasErrors(bean: contratoVigenciaInstance, field: 'qtHoras', 'error')} required">
  <label for="qtHoras">
    <g:message code="contratoVigencia.qtHoras.label" default="Qt Horas" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField id="qtHoras" name="contratoVigenciaInstance.qtHoras" required="" value="${fieldValue(bean: contratoVigenciaInstance, field: 'qtHoras')}"/>
</div>


