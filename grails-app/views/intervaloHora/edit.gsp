<%@ page import="sph.domain.cliente.grade.IntervaloHora" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'intervaloHora.label', default: 'IntervaloHora')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <g:if test="${conversation}">
        <sphlay:navbck action="edit" backcontroller="${backcontroller}" backaction="${backaction}" backid="${backid}"/>
    </g:if>
    <g:else>
        <sphlay:nav action="edit" />
    </g:else>
    
    <div id="edit-intervaloHora" class="grid_16">
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
            <g:form method="post" >
                <g:hiddenField name="id" value="${intervaloHoraInstance?.id}" />
                <g:hiddenField name="version" value="${intervaloHoraInstance?.version}" />
                
                <fieldset class="form">
                    <legend>Edição</legend>                                    
                    <g:render template="form" />
                </fieldset>
                
                <fieldset class="buttons">
                    <g:actionSubmit class="nav-button" action="update"
                        value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="nav-button" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            
        </div>
        <!--  Block  -->
    </div>
    <!--  grid_16 -->
    
</body>
</html>
