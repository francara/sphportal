<%@ page import="sph.domain.cliente.grade.DiaSemanaIntervalo" %>



<div class="fieldcontain ${hasErrors(bean: diaSemanaIntervaloInstance, field: 'dia', 'error')} required">
	<label for="dia">
		<g:message code="diaSemanaIntervalo.dia.label" default="Dia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dia" name="dia.id" from="${sph.domain.cliente.grade.GradeDia.list()}" optionKey="id" required="" value="${diaSemanaIntervaloInstance?.dia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: diaSemanaIntervaloInstance, field: 'intervalo', 'error')} required">
	<label for="intervalo">
		<g:message code="diaSemanaIntervalo.intervalo.label" default="Intervalo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="intervalo" name="intervalo.id" from="${sph.domain.cliente.grade.IntervaloHora.list()}" optionKey="id" required="" value="${diaSemanaIntervaloInstance?.intervalo?.id}" class="many-to-one"/>
</div>

