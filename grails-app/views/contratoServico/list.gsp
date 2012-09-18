<%@ page import="sph.domain.cliente.ContratoServico"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contratoServico.label', default: 'ContratoServico')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-contratoServico" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th><g:message code="contratoServico.catalogo.label" default="Catalogo" /></th>
                        <th><g:message code="contratoServico.contrato.label" default="Contrato" /></th>
                        <g:sortableColumn property="descricao" title="${message(code: 'contratoServico.descricao.label', default: 'Descricao')}" />
                        <th><g:message code="contratoServico.prazo.label" default="Prazo" /></th>
                        <th><g:message code="contratoServico.prioridade.label" default="Prioridade" /></th>
                        <g:sortableColumn property="qtMinimaLactoMinutos" title="${message(code: 'contratoServico.qtMinimaLactoMinutos.label', default: 'Minimo Min.')}" />
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${contratoServicoInstanceList}" status="i" var="contratoServicoInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${contratoServicoInstance.id}">
                                    ${contratoServicoInstance.catalogo.descricao}
                                </g:link></td>

                            <td>
                                ${contratoServicoInstance.contrato.cliente.nomeFantasia}
                            </td>

                            <td>
                                ${fieldValue(bean: contratoServicoInstance, field: "descricao")}
                            </td>

                            <td>
                                ${fieldValue(bean: contratoServicoInstance, field: "prazo")}
                            </td>

                            <td>
                                ${fieldValue(bean: contratoServicoInstance, field: "prioridade")}
                            </td>

                            <td>
                                ${fieldValue(bean: contratoServicoInstance, field: "qtMinimaLactoMinutos")}
                            </td>
                            <td>
                              <g:link action="show" id="${contratoServicoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${contratoServicoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${contratoServicoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${contratoServicoInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
