<%@ page import="sph.domain.acesso.GrupoAcesso"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'grupoAcesso.label', default: 'GrupoAcesso')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <%--
    =============================
    ===  Barra de Navegacao   ===
    =============================
    --%>
    <sphlay:nav action="edit" />

    <div id="edit-grupoAcesso" class="grid_16" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${grupoAcessoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${grupoAcessoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form method="post">
            <g:hiddenField name="id" value="${grupoAcessoInstance?.id}" />
            <g:hiddenField name="version" value="${grupoAcessoInstance?.version}" />
        
            <%--
            ==========================================
            =========   Controle de Acesso   =========
            ==========================================
            --%>
            <div class="grid_16" style="margin-top: 10px; margin-bottom: 10px">
                <div class="grid_4 alpha">
                    <div style="background-color: #E3F1F8; height: 150px; border: 1px ridge #0A344D; padding: 5px 0px 0px 5px;">
                    <fieldset class="form">
                        <g:render template="/acesso/grupo/form" />
                    </fieldset>
                    </div>
                </div>
                <!--  grid_4 alpha -->
                <div class="grid_12 omega">
                    <div
                        style="background-color: #5586A2; height: 1.5em; border: 1px ridge #0A344D; padding: 2px 00px 0px 5px; margin-right: 10px; margin-bottom: 10px;">
                        <p style="color: #ffffff;">Permissões</p>
                    </div>
                    <g:render template="/acesso/grupo/permissao" />
                </div>
                <!-- grid_12 omega -->

            </div>
            <!-- grid_16 -->

            <div class="clear"></div>

            <%--
            ====================================
            ===   Barra de botões inferior   ===
            ====================================
            --%>
            <fieldset class="buttons" style="color: #ffffff">
                <g:actionSubmit class="nav-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit class="nav-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                    formnovalidate=""
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</body>
</html>
