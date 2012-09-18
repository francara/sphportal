

<%@ page import="sph.domain.cliente.Catalogo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'catalogo.label', default: 'Catalogo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-catalogo" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<g:sortableColumn property="descricao" title="${message(code: 'catalogo.descricao.label', default: 'Descricao')}" />
					
                    <th width=10%></th>                    
                </tr>
            </thead>
            <tbody>
                <g:each in="${catalogoInstanceList}" status="i" var="catalogoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
						<td><g:link action="show" id="${catalogoInstance.id}">${fieldValue(bean: catalogoInstance, field: "descricao")}</g:link></td>
					
                            <td>
                              <g:link action="show" id="${catalogoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${catalogoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${catalogoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                      onclick="return confirm('Tem certeza?');"/>
                            </td>                    
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${catalogoInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
