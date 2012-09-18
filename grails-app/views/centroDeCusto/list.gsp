

<%@ page import="sph.domain.cliente.CentroDeCusto"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'centroDeCusto.label', default: 'CentroDeCusto')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-centroDeCusto" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="codigo" title="${message(code: 'centroDeCusto.codigo.label', default: 'Codigo')}" />
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${centroDeCustoInstanceList}" status="i" var="centroDeCustoInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${centroDeCustoInstance.id}"> ${fieldValue(bean: centroDeCustoInstance, field: "codigo")} </g:link></td>
                            <td>
                              <g:link action="show" id="${centroDeCustoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${centroDeCustoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${centroDeCustoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>                            
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${centroDeCustoInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
