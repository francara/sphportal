

<%@ page import="sph.domain.basico.Cidade"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'cidade.label', default: 'Cidade')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-cidade" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="descricao" title="${message(code: 'cidade.descricao.label', default: 'Descricao')}" />
                        <th><g:message code="cidade.uf.label" default="Uf" /></th>
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${cidadeInstanceList}" status="i" var="cidadeInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${cidadeInstance.id}">
                                    ${fieldValue(bean: cidadeInstance, field: "descricao")}
                                </g:link></td>
                            <td>
                                ${fieldValue(bean: cidadeInstance, field: "uf.codigo")}
                            </td>

                            <td><g:link action="show" id="${cidadeInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" />
                                <g:link action="edit" id="${cidadeInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" /> <g:link
                                    action="delete" id="${cidadeInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-trash"
                                    title="Remover" 
                                    onclick="return confirm('Tem certeza?');"
                                     /></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${cidadeInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
