<%@ page import="sph.domain.cliente.grade.GradeHorasDia" %>



<div class="fieldcontain ${hasErrors(bean: gradeHorasDiaInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="gradeHorasDia.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grade" name="grade.id" from="${sph.domain.cliente.grade.GradeHoras.list()}" optionKey="id" required="" value="${gradeHorasDiaInstance?.grade?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradeHorasDiaInstance, field: 'gradeDia', 'error')} required">
	<label for="gradeDia">
		<g:message code="gradeHorasDia.gradeDia.label" default="Grade Dia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="gradeDia" name="gradeDia.id" from="${sph.domain.cliente.grade.GradeDia.list()}" optionKey="id" required="" value="${gradeHorasDiaInstance?.gradeDia?.id}" class="many-to-one"/>
</div>

