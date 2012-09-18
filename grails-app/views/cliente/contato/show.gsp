

<%@ page import="sph.domain.cliente.Contato" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contato.label', default: 'Contato')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-contato" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list contato">
                        
				<g:if test="${contatoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="contato.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${contatoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.apelido}">
				<li class="fieldcontain">
					<span id="apelido-label" class="property-label"><g:message code="contato.apelido.label" default="Apelido" /></span>
					
						<span class="property-value" aria-labelledby="apelido-label"><g:fieldValue bean="${contatoInstance}" field="apelido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.cpf}">
				<li class="fieldcontain">
					   <span id="cpf-label" class="property-label"><g:message code="contato.cpf.label" default="Cpf" /></span>
						 <span class="property-value" aria-labelledby="cpf-label">${contatoInstance.cpf()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="contato.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${contatoInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="contato.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${contatoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="contato.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${contatoInstance?.cliente?.id}">${contatoInstance?.cliente?.nomeFantasia}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="contato.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:fieldValue bean="${contatoInstance}" field="departamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contatoInstance?.fones}">
				<li class="fieldcontain">
					<span id="fones-label" class="property-label"><g:message code="contato.fones.label" default="Fones" /></span>
					
						<g:each in="${contatoInstance.fones}" var="f">
						<span class="property-value" aria-labelledby="fones-label"><g:link controller="fone" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
                    </ol>
                </fieldset>
                
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${contatoInstance?.id}" />
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
