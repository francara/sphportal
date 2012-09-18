

<%@ page import="sph.domain.cliente.PrazoAtendimento" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-prazoAtendimento" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list prazoAtendimento">
                        
				<g:if test="${prazoAtendimentoInstance?.prazoIndeterminado}">
				<li class="fieldcontain">
					<span id="prazoIndeterminado-label" class="property-label"><g:message code="prazoAtendimento.prazoIndeterminado.label" default="Prazo Indeterminado" /></span>
					
						<span class="property-value" aria-labelledby="prazoIndeterminado-label"><g:formatBoolean boolean="${prazoAtendimentoInstance?.prazoIndeterminado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prazoAtendimentoInstance?.qtMinutosAtendimento}">
				<li class="fieldcontain">
					<span id="qtMinutosAtendimento-label" class="property-label"><g:message code="prazoAtendimento.qtMinutosAtendimento.label" default="Qt Minutos Atendimento" /></span>
					
						<span class="property-value" aria-labelledby="qtMinutosAtendimento-label"><g:fieldValue bean="${prazoAtendimentoInstance}" field="qtMinutosAtendimento"/></span>
					
				</li>
				</g:if>
			
                    </ol>
                </fieldset>
                
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${prazoAtendimentoInstance?.id}" />
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
