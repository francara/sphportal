<%@ page import="sph.domain.acesso.Usuario"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

    <%--
    =============================
    ===  Barra de Navegacao   ===
    =============================
    --%>
    <sphlay:nav action="create" />
    
    
    <div id="create-usuario" class="grid_16" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${usuarioInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${usuarioInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form action="save">
        
            <%--
            ===========================================
            =========   Cadastro de Usuario   =========
            ===========================================
            --%>
            <div class="grid_16" style="margin-top: 10px; margin-bottom: 10px">
            
            <fieldset class="form">
                <g:render template="/acesso/usuario/form" />
            </fieldset>
                        
            </div> <!-- grid_16 -->
        
            <%--
            ====================================
            ===   Barra de botões inferior   ===
            ====================================
            --%>            
            <fieldset class="buttons">
                <g:submitButton name="create" class="nav-button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</body>
</html>
