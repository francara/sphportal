
<%@ page import="sph.domain.acesso.GrupoAcesso"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'grupoAcesso.label', default: 'GrupoAcesso')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <%--
    =============================
    ===  Barra de Navegacao   ===
    =============================
    --%>
    <sphlay:nav action="show" />

    <div id="show-grupoAcesso" class="content scaffold-show" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <%--
        ==========================================
        =========   Controle de Acesso   =========
        ==========================================
         --%>
        <div class="grid_16" style="margin-top:10px; margin-bottom:10px">
        <div class="grid_4 alpha">
        <div style="
          background-color: #E3F1F8; 
          height: 150px; border: 1px ridge #0A344D;
          padding: 5px 0px 0px 5px;
        ">
            <g:if test="${grupoAcessoInstance?.nome}">
                <span id="nome-label" class="property-label"> <g:message code="grupoAcesso.nome.label" default="Nome" /></span>
                <span class="property-value" aria-labelledby="nome-label"> <g:fieldValue bean="${grupoAcessoInstance}" field="nome" /></span>
            </g:if>
        </div></div> <!--  grid_4 alpha -->
        <div class="grid_12 omega">
        <div style="
          background-color: #5586A2; 
          height: 1.5em; border: 1px ridge #0A344D;
          padding: 2px 00px 0px 5px;
          margin-right: 10px;          
          margin-bottom: 10px;
        "><p style="color: #ffffff;">Permissões</p></div>
            <g:render template="/acesso/grupo/permissao" />
        </div> <!-- grid_12 omega -->
        
        </div> <!-- grid_16 -->

        <div class="clear"></div>
        
        <%--
        ====================================
        ===   Barra de botões inferior   ===
        ====================================
        --%>
        <g:form>
            <fieldset class="buttons" style="color: #ffffff">
                <g:hiddenField name="id" value="${grupoAcessoInstance?.id}" />
                <g:actionSubmit class="nav-button" action="edit" value="${message(code: 'default.button.edit.label', default: 'EditBla')}"/>
                <g:actionSubmit class="nav-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</body>
</html>
