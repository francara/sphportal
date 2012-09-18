<%@ page import="sph.domain.cliente.grade.GradeHoras"%>
<%@ page import="sph.domain.cliente.grade.GradeDia"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeHoras.label', default: 'GradeHoras')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="edit" />

    <div id="edit-gradeHoras" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <g:hasErrors bean="${gradeHorasInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${gradeHorasInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form method="post">
            <div class="block" id="forms">
                <g:hiddenField name="id" value="${gradeHorasInstance?.id}" />
                <g:hiddenField name="version" value="${gradeHorasInstance?.version}" />

                <fieldset class="form">
                    <legend>Edição</legend>
                    <div class="grid_6">
                        <g:render template="form" />
                    </div>
                    <div class="grid_9" style="float:left; position:relative; top:5px">
                    <ul style=" list-style:none;">
                        <li style="float:left; position:relative; right: -50px"> 
                            <g:select name="gradeDia" optionKey="id" optionValue="descricao" style="width:200px"
                                from="${gradeDiasList}"                           />
                        </li>
                        <li style="display:inline; position:relative; right:  -50px">
                            <g:actionSubmit class="fg-button ui-state-default fg-button-icon-left ui-corner-all" action="addGradeDia" value="Adicionar Dia" />
                        </li>
                        <li style="float:right">
                            <g:link class="fg-button ui-state-default fg-button-icon-left ui-corner-all" 
                                controller="gradeDia" action="create"
                                params="[conversation: 1, backcontroller: 'gradeHoras', backaction: 'edit', backid: "${gradeHorasInstance.id}"]" >
                                <span class="ui-icon ui-icon-circle-plus"></span> Novo Dia
                            </g:link>                            
                        </li>
                    </ul>
                    </div>                    
                </fieldset>
            </div>
            <!--  Block  -->

            <div class="box">
                <h2>Intervalo Dias</h2>
                <tmpl:gradeDia gradeHorasInstance="${gradeHorasInstance}" gradeHorasItemList="${gradeHorasItemList}" />
            </div>
            <fieldset class="buttons">
                <g:actionSubmit class="nav-button" action="update"
                    value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit class="nav-button" action="delete"
                    value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>

    </div>
    <!--  grid_16 -->

</body>
</html>
