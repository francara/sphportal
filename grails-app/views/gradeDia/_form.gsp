<%@ page import="sph.domain.cliente.grade.GradeDia" %>



<div class="fieldcontain ${hasErrors(bean: gradeDiaInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="gradeDia.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${gradeDiaInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradeDiaInstance, field: 'diaUtil', 'error')} ">
	<label for="diaUtil">
		<g:message code="gradeDia.diaUtil.label" default="Dia Util" />
		
	</label>
	<g:checkBox name="diaUtil" value="${gradeDiaInstance?.diaUtil}" />
</div>


