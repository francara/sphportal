

<%@ page import="sph.domain.basico.Uf" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'uf.label', default: 'Uf')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-uf" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<g:sortableColumn property="codigo" title="${message(code: 'uf.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'uf.descricao.label', default: 'Descricao')}" />
					
                </tr>
            </thead>
            <tbody>
                <g:each in="${ufInstanceList}" status="i" var="ufInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
						<td><g:link action="show" id="${ufInstance.id}">${fieldValue(bean: ufInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: ufInstance, field: "descricao")}</td>
					
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${ufInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
