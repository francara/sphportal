<%@ page import="sph.domain.cliente.grade.IntervaloHora" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'intervaloHora.label', default: 'IntervaloHora')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${conversation}">
        <sphlay:navbck action="create" backcontroller="${backcontroller}" backaction="${backaction}" backid="${backid}"/>
    </g:if>
    <g:else>
        <sphlay:nav action="create" />
    </g:else>
    
    <div id="create-intervaloHora" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${intervaloHoraInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${intervaloHoraInstance}" var="error">
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
