<%@ page import="sph.domain.cliente.ContratoVigencia"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contratoVigencia.label', default: 'ContratoVigencia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-contratoVigencia" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            
            <table>
                <thead>
                    <tr>
                        <th><g:message code="contrato.cliente.label" default="Cliente" /></th>
                        <g:sortableColumn property="descricao" title="${message(code: 'contrato.descricao.label', default: 'Descricao')}" />
                        <g:sortableColumn property="qtHoras" title="${message(code: 'contratoVigencia.qtHoras.label', default:"Horas")}" />
                        <g:sortableColumn property="dataInicio" title="${message(code: 'contratoVigencia.dataInicio.label', default: 'Inicio')}" />
                        <g:sortableColumn property="dataTermino" title="${message(code: 'contratoVigencia.dataTermino.label', default: 'Termino')}" />
                        <th width=10%></th>                        
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${contratoVigenciaInstanceList}" status="i" var="contratoVigenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td width=30%><g:link action="show" id="${contratoVigenciaInstance.id}">
                                ${contratoVigenciaInstance.contrato.cliente.nomeFantasia}
                                </g:link></td>
                            <td width=25%>${contratoVigenciaInstance.contrato.descricao}</td>
                            <td width=5%>
                                ${contratoVigenciaInstance.qtHoras}
                            </td>
                            <td width=15%>${contratoVigenciaInstance.dataInicio}"</td>
                            <td width=15%>${contratoVigenciaInstance.dataTermino}"</td>
                            <td>
                              <g:link action="show" id="${contratoVigenciaInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${contratoVigenciaInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${contratoVigenciaInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>                            
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${contratoVigenciaInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
