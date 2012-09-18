

<%@ page import="sph.domain.basico.Feriado" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'feriado.label', default: 'Feriado')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-feriado" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<th><g:message code="feriado.cidade.label" default="Cidade" /></th>
					
						<th><g:message code="feriado.uf.label" default="Uf" /></th>
					
						<g:sortableColumn property="data" title="${message(code: 'feriado.data.label', default: 'Data')}" />
					
						<g:sortableColumn property="nacional" title="${message(code: 'feriado.nacional.label', default: 'Nacional')}" />
					
                    <th width=10%></th>                    
                </tr>
            </thead>
            <tbody>
                <g:each in="${feriadoInstanceList}" status="i" var="feriadoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${feriadoInstance.id}">${feriadoInstance?.cidade?.descricao}</g:link></td>
						<td>${feriadoInstance?.uf?.descricao}</td>
						<td>${feriadoInstance?.data?.format('dd/MM/yyyy')}</td>
						<td><g:formatBoolean boolean="${feriadoInstance.nacional}" /></td>
					
                            <td>
                              <g:link action="show" id="${feriadoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${feriadoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${feriadoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>                    
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${feriadoInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
