<%@ page import="sph.domain.cliente.Contrato"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="create" />

    <div id="create-contrato" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${contratoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${contratoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form action="save">
            <div class="block" id="forms">
                <fieldset class="form">
                    <legend>Criação</legend>
                    <g:render template="form" />
                </fieldset>
            </div>
            <!-- Block  -->
            <div class="clear"></div>
            <div class="box" style="height: 250px">
                <h2>Vigencia</h2>
                <g:render template="vigencia" />
            </div>

            <div class="clear"></div>
            <fieldset class="buttons">
                <g:submitButton name="create" class="nav-button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
    <!--  grid_16 -->
</body>
</html>
