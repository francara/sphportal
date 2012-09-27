

<%@ page import="sph.domain.cliente.grade.DiaSemanaIntervalo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'diaSemanaIntervalo.label', default: 'DiaSemanaIntervalo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-diaSemanaIntervalo" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<th><g:message code="diaSemanaIntervalo.dia.label" default="Dia" /></th>
					
						<th><g:message code="diaSemanaIntervalo.intervalo.label" default="Intervalo" /></th>
					
                    <th width=10%></th>                    
                </tr>
            </thead>
            <tbody>
                <g:each in="${diaSemanaIntervaloInstanceList}" status="i" var="diaSemanaIntervaloInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
						<td><g:link action="show" id="${diaSemanaIntervaloInstance.id}">${diaSemanaIntervaloInstance.dia?.descricao}</g:link></td>
					
						<td>${fieldValue(bean: diaSemanaIntervaloInstance, field: "intervalo")}</td>
					
                            <td>
                              <g:link action="show" id="${diaSemanaIntervaloInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${diaSemanaIntervaloInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${diaSemanaIntervaloInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                      onclick="return confirm('Tem certeza?');"/>
                            </td>                    
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${diaSemanaIntervaloInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
