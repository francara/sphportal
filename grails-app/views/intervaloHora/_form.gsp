<%@ page import="sph.domain.cliente.grade.IntervaloHora" %>
<%@ page import="org.joda.time.LocalTime" %>


<div class="fieldcontain ${hasErrors(bean: intervaloHoraInstance, field: 'horaInicio', 'error')} required">
  <label for="horaInicio">
    <g:message code="intervaloHora.horaInicio.label" default="Hora Inicio" />
    <span class="required-indicator">*</span>
  </label>
  <joda:timeField id="dtIni" name="horaInicio" value="${intervaloHoraInstance.horaInicio}" /> 
</div>


<div class="fieldcontain ${hasErrors(bean: intervaloHoraInstance, field: 'horaFim', 'error')} required">
	<label for="horaFim">
		<g:message code="intervaloHora.horaFim.label" default="Hora Fim" />
		<span class="required-indicator">*</span>
	</label>
  <joda:timeField id="dtFim" name="horaFim" value="${intervaloHoraInstance.horaFim}" />	
</div>

<script language="javascript" >
$().ready(function() {    
      $('#dtIni').setMask('time')
      $('#dtFim').setMask('time')
});
</script>

<div class="fieldcontain ${hasErrors(bean: intervaloHoraInstance, field: 'percentualExtra', 'error')} required">
	<label for="percentualExtra">
		<g:message code="intervaloHora.percentualExtra.label" default="Percentual Extra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="percentualExtra" required="" value="${fieldValue(bean: intervaloHoraInstance, field: 'percentualExtra')}"/>
</div>

