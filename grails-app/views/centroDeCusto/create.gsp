<%@ page import="sph.domain.cliente.CentroDeCusto" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'centroDeCusto.label', default: 'CentroDeCusto')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="create" />

    <div id="create-centroDeCusto" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${centroDeCustoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${centroDeCustoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="block" id="forms">

            <g:form action="save" >
                <fieldset class="form">
                    <legend>Criação</legend>
                    <g:render template="form" />
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
