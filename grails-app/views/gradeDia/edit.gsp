<%@ page import="sph.domain.cliente.grade.GradeDia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeDia.label', default: 'GradeDia')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <g:if test="${conversation}">
        <sphlay:navbck action="edit" backcontroller="${backcontroller}" backaction="${backaction}" backid="${backid}"/>
    </g:if>
    <g:else>
        <sphlay:nav action="edit" />
    </g:else>

    <div id="edit-gradeDia" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <g:hasErrors bean="${gradeDiaInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${gradeDiaInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="block" id="forms">
            <g:form method="post">
                <g:hiddenField name="id" value="${gradeDiaInstance?.id}" />
                <g:hiddenField name="version" value="${gradeDiaInstance?.version}" />
                <g:if test="${conversation}">
                    <g:hiddenField name="conversation" value="1" />                
                    <g:hiddenField name="backcontroller" value="${backcontroller}" />                
                    <g:hiddenField name="backaction" value="${backaction}" />                
                    <g:hiddenField name="backid" value="${backid}" />                
                </g:if>
                
                <fieldset class="form">
                    <legend>Edição</legend>
                    <div class="grid_6">
                        <g:render template="form" />
                    </div>
                    <div class="grid_9" style="float:left; position:relative; top:8px; left: -50px">
                    
                    <ul style=" list-style:none;">
                        <li style="float:left; position:relative; right: -50px"> 
                            <g:select name="intervaloHora" optionKey="id" optionValue="horaInicio" style="width:200px"
                                from="${exclusiveIntervalosList}"                           />
                        </li>
                        <li style="display:inline; position:relative; right:  -60px">
                            <g:actionSubmit class="fg-button ui-state-default fg-button-icon-left ui-corner-all" action="addIntervalo" value="Adicionar" />
                        </li>
                        <li style="float:right; position: relative; left: 20px">
                            <g:if test="${conversation}"/>
                            <g:else>
                                <g:set var="conversation" value="1" />
                                <g:set var="backcontroller" value="gradeDia" />
                                <g:set var="backaction" value="edit" />
                                <g:set var="backid" value="${gradeDiaInstance.id}" />                            
                            </g:else>
                            <g:link class="fg-button ui-state-default fg-button-icon-left ui-corner-all"  style="float: right"
                                  controller="intervaloHora" action="create" 
                                  params="[conversation: 1, backcontroller: "${backcontroller}", backaction: "${backaction}", backid: "${backid}"]" >
                                      <span class="ui-icon ui-icon-circle-plus"></span> Novo Intervalo
                            </g:link>
                        </li>
                    </ul>                    
       
                    </div>                     
                </fieldset>

                <div class="box">
                    <h2>Intervalo Dias</h2>
                    <tmpl:intervalosHora intervaloHoraInstanceList="${intervaloInstanceList}" />
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
        <!--  Block  -->
    </div>
    <!--  grid_16 -->

</body>
</html>
