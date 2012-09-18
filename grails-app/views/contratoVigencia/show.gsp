

<%@ page import="sph.domain.cliente.ContratoVigencia" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contratoVigencia.label', default: 'ContratoVigencia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-contratoVigencia" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list contratoVigencia">
                        
				<g:if test="${contratoVigenciaInstance?.dataTermino}">
				<li class="fieldcontain">
					<span id="dataTermino-label" class="property-label"><g:message code="contratoVigencia.dataTermino.label" default="Data Termino" /></span>
					
						<span class="property-value" aria-labelledby="dataTermino-label">${contratoVigenciaInstance?.dataTermino?.format('dd/MM/yyyy')}</span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.qtTickets}">
				<li class="fieldcontain">
					<span id="qtTickets-label" class="property-label"><g:message code="contratoVigencia.qtTickets.label" default="Qt Tickets" /></span>
					
						<span class="property-value" aria-labelledby="qtTickets-label"><g:fieldValue bean="${contratoVigenciaInstance}" field="qtTickets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.numeroAditivo}">
				<li class="fieldcontain">
					<span id="numeroAditivo-label" class="property-label"><g:message code="contratoVigencia.numeroAditivo.label" default="Numero Aditivo" /></span>
					
						<span class="property-value" aria-labelledby="numeroAditivo-label"><g:fieldValue bean="${contratoVigenciaInstance}" field="numeroAditivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.contrato}">
				<li class="fieldcontain">
					<span id="contrato-label" class="property-label"><g:message code="contratoVigencia.contrato.label" default="Contrato" /></span>
					
						<span class="property-value" aria-labelledby="contrato-label"><g:link controller="contrato" action="show" id="${contratoVigenciaInstance?.contrato?.id}">${contratoVigenciaInstance?.contrato?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.dataAssinatura}">
				<li class="fieldcontain">
					<span id="dataAssinatura-label" class="property-label"><g:message code="contratoVigencia.dataAssinatura.label" default="Data Assinatura" /></span>
					
						<span class="property-value" aria-labelledby="dataAssinatura-label">${contratoVigenciaInstance?.dataAssinatura}"</span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.dataInicio}">
				<li class="fieldcontain">
					<span id="dataInicio-label" class="property-label"><g:message code="contratoVigencia.dataInicio.label" default="Data Inicio" /></span>
					
						<span class="property-value" aria-labelledby="dataInicio-label">${contratoVigenciaInstance?.dataInicio}"</span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.horaAberta}">
				<li class="fieldcontain">
					<span id="horaAberta-label" class="property-label"><g:message code="contratoVigencia.horaAberta.label" default="Hora Aberta" /></span>
					
						<span class="property-value" aria-labelledby="horaAberta-label"><g:formatBoolean boolean="${contratoVigenciaInstance?.horaAberta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.margemFatExtra}">
				<li class="fieldcontain">
					<span id="margemFatExtra-label" class="property-label"><g:message code="contratoVigencia.margemFatExtra.label" default="Margem Fat Extra" /></span>
					
						<span class="property-value" aria-labelledby="margemFatExtra-label"><g:fieldValue bean="${contratoVigenciaInstance}" field="margemFatExtra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.qtHoras}">
				<li class="fieldcontain">
					<span id="qtHoras-label" class="property-label"><g:message code="contratoVigencia.qtHoras.label" default="Qt Horas" /></span>
					
						<span class="property-value" aria-labelledby="qtHoras-label"><g:fieldValue bean="${contratoVigenciaInstance}" field="qtHoras"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contratoVigenciaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="contratoVigencia.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${contratoVigenciaInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
                    </ol>
                </fieldset>
                
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${contratoVigenciaInstance?.id}" />
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
