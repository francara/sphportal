

<%@ page import="sph.domain.cliente.grade.IntervaloHora"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'intervaloHora.label', default: 'IntervaloHora')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-intervaloHora" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="horaInicio" title="${message(code: 'intervaloHora.horaInicio.label', default: 'Hora Inicio')}" />
                        <g:sortableColumn property="horaFim" title="${message(code: 'intervaloHora.horaFim.label', default: 'Hora Fim')}" />
                        <g:sortableColumn property="percentualExtra" title="${message(code: 'intervaloHora.percentualExtra.label', default: 'Percentual Extra')}" />
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${intervaloHoraInstanceList}" status="i" var="intervaloHoraInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>
                                ${fieldValue(bean: intervaloHoraInstance, field: "horaInicio")}
                            </td>
                            <td>
                                 ${fieldValue(bean: intervaloHoraInstance, field: "horaFim")}
                            </td>
                            <td>
                                ${fieldValue(bean: intervaloHoraInstance, field: "percentualExtra")}
                            </td>
                            <td><g:link action="show" id="${intervaloHoraInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" />
                                <g:link action="edit" id="${intervaloHoraInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" /> <g:link
                                    action="delete" id="${intervaloHoraInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                    onclick="return confirm('Tem certeza?');" /></td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${intervaloHoraInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
