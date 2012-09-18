

<%@ page import="sph.domain.cliente.grade.GradeHorasDia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeHorasDia.label', default: 'GradeHorasDia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-gradeHorasDia" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list gradeHorasDia">
                        
				<g:if test="${gradeHorasDiaInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="gradeHorasDia.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:link controller="gradeHoras" action="show" id="${gradeHorasDiaInstance?.grade?.id}">${gradeHorasDiaInstance?.grade?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradeHorasDiaInstance?.gradeDia}">
				<li class="fieldcontain">
					<span id="gradeDia-label" class="property-label"><g:message code="gradeHorasDia.gradeDia.label" default="Grade Dia" /></span>
					
						<span class="property-value" aria-labelledby="gradeDia-label"><g:link controller="gradeDia" action="show" id="${gradeHorasDiaInstance?.gradeDia?.id}">${gradeHorasDiaInstance?.gradeDia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
                    </ol>
                </fieldset>
                
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${gradeHorasDiaInstance?.id}" />
                    <g:actionSubmit class="nav-button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="nav-button" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        <!--  Block  -->
    </div>
    <!-- grid_16  -->
</body>
</html>
