

<%@ page import="sph.domain.basico.Cep" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'cep.label', default: 'Cep')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-cep" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<g:sortableColumn property="codigo" title="${message(code: 'cep.codigo.label', default: 'Codigo')}" />
					
						<th><g:message code="cep.cidade.label" default="Cidade" /></th>
					
						<g:sortableColumn property="logradouro" title="${message(code: 'cep.logradouro.label', default: 'Logradouro')}" />
					
                    <th width=10%></th>                    
                </tr>
            </thead>
            <tbody>
                <g:each in="${cepInstanceList}" status="i" var="cepInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
						<td><g:link action="show" id="${cepInstance.id}">${fieldValue(bean: cepInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: cepInstance, field: "cidade")}</td>
					
						<td>${fieldValue(bean: cepInstance, field: "logradouro")}</td>
					
                            <td>
                              <g:link action="show" id="${cepInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${cepInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${cepInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                      onclick="return confirm('Tem certeza?');"/>
                            </td>                    
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${cepInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
