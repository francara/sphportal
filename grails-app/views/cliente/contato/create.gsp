<%@ page import="sph.domain.cliente.Contato" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contato.label', default: 'Contato')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="create" />

    <div id="create-contato" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${contatoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${contatoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="block" id="forms">

            <g:form action="save" >
                <div class="grid_10">
                    <fieldset class="form">
                        <legend>Criação</legend>
                        <g:render template="/cliente/contato/form" />
                    </fieldset>
                </div>
                <div class="grid_5">
                    <div class="box">
                        <h2>Usuário</h2>
                        <a href="#" class="fg-button ui-state-default fg-button-icon-left ui-corner-all" 
                            onclick="${remoteFunction(action: 'createUsuario', update:'usuarioPn')}"> 
                            <span class="ui-icon ui-icon-circle-plus"></span> Adicionar Usuário
                        </a>
                        <div id="usuarioPn" class="block">
                            &nbsp;
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                
                <fieldset class="buttons">
                    <g:submitButton name="create" class="nav-button"
                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
            
        </div>
        <!--  Block  -->
    </div>
    <!--  grid_16 -->
    
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    <g:render template='/cliente/contato/fone' model="['fone':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->    
</body>
</html>
