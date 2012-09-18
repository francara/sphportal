

<%@ page import="sph.domain.cliente.PrazoAtendimento" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'prazoAtendimento.label', default: 'PrazoAtendimento')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
    <div id="list-prazoAtendimento" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>
                    
						<g:sortableColumn property="prazoIndeterminado" title="${message(code: 'prazoAtendimento.prazoIndeterminado.label', default: 'Prazo Indeterminado')}" />
					
						<g:sortableColumn property="qtMinutosAtendimento" title="${message(code: 'prazoAtendimento.qtMinutosAtendimento.label', default: 'Qt Minutos Atendimento')}" />
					
                    <th width=10%></th>                    
                </tr>
            </thead>
            <tbody>
                <g:each in="${prazoAtendimentoInstanceList}" status="i" var="prazoAtendimentoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
						<td><g:link action="show" id="${prazoAtendimentoInstance.id}">${fieldValue(bean: prazoAtendimentoInstance, field: "prazoIndeterminado")}</g:link></td>
					
						<td>${fieldValue(bean: prazoAtendimentoInstance, field: "qtMinutosAtendimento")}</td>
					
                            <td>
                              <g:link action="show" id="${prazoAtendimentoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${prazoAtendimentoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${prazoAtendimentoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                      onclick="return confirm('Tem certeza?');"/>
                            </td>                    
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${prazoAtendimentoInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
