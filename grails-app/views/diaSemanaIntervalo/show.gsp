

<%@ page import="sph.domain.cliente.grade.DiaSemanaIntervalo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-diaSemanaIntervalo" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list diaSemanaIntervalo">
                        
				<g:if test="${diaSemanaIntervaloInstance?.dia}">
				<li class="fieldcontain">
					<span id="dia-label" class="property-label"><g:message code="diaSemanaIntervalo.dia.label" default="Dia" /></span>
					
						<span class="property-value" aria-labelledby="dia-label"><g:link controller="gradeDia" action="show" id="${diaSemanaIntervaloInstance?.dia?.id}">${diaSemanaIntervaloInstance?.dia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${diaSemanaIntervaloInstance?.intervalo}">
				<li class="fieldcontain">
					<span id="intervalo-label" class="property-label"><g:message code="diaSemanaIntervalo.intervalo.label" default="Intervalo" /></span>
					
						<span class="property-value" aria-labelledby="intervalo-label"><g:link controller="intervaloHora" action="show" id="${diaSemanaIntervaloInstance?.intervalo?.id}">${diaSemanaIntervaloInstance?.intervalo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
                    </ol>
                </fieldset>
                
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${diaSemanaIntervaloInstance?.id}" />
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
