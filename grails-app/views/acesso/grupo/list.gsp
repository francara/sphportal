<%@ page import="sph.domain.acesso.GrupoAcesso"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'grupoAcesso.label', default: 'GrupoAcesso')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
    <%--
    =============================
    ===  Barra de Navegacao   ===
    =============================
    --%>
    <sphlay:nav action="list" />
    <%--
    =================
    ===  Grupos   ===
    ================= 
    --%>
    <div class="grid_14 prefix_1 suffix_1">
    <div id="list-grupoAcesso" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <%-- ===   Grid de grupos   === --%>
        <table class="domain-list">
            <thead>
                <tr>
                    <g:sortableColumn property="nome" title="${message(code: 'grupoAcesso.nome.label', default: 'Nome')}" />
                    <th width=10%></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${grupoAcessoInstanceList}" status="i" var="grupoAcessoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${grupoAcessoInstance.id}">
                                ${fieldValue(bean: grupoAcessoInstance, field: "nome")}
                            </g:link>
                        </td>
                            <td>
                              <g:link action="show" id="${grupoAcessoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${grupoAcessoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${grupoAcessoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>                             
                    </tr>
                </g:each>
            </tbody>
        </table>
        <%-- ===   Paginacao   === --%>
        <div class="pagination">
            <g:paginate total="${grupoAcessoInstanceTotal}" />
        </div>
    </div></div> <!-- grid_14 prefix_1 suffix_1 -->
</body>
</html>
