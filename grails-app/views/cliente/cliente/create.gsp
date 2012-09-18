<%@ page import="sph.domain.cliente.Cliente"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="create" />

    <div id="create-cliente" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${clienteInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${clienteInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="block" id="forms">

            <g:form action="save">
                <fieldset class="form">
                    <legend>Dados</legend>                                    
                    <g:render template="cliente/formDados" />
                </fieldset>
                <fieldset class="form">
                    <legend>Endereço</legend>                                    
                    <g:render template="cliente/formEndereco" />
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="nav-button"
                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>

        </div>
        <!--  Block  -->
    </div>
    <!--  grid_16 -->
</body>
</html>
