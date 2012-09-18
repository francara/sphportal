

<%@ page import="sph.domain.cliente.grade.GradeHorasDia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeHorasDia.label', default: 'GradeHorasDia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">
        <div id="list-gradeHorasDia" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">
                    ${flash.message}
                </div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th><g:message code="gradeHorasDia.grade.label" default="Grade" /></th>
                        <th><g:message code="gradeHorasDia.gradeDia.label" default="Grade Dia" /></th>
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${gradeHorasDiaInstanceList}" status="i" var="gradeHorasDiaInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${gradeHorasDiaInstance.id}">
                                    ${fieldValue(bean: gradeHorasDiaInstance, field: "grade")}
                                </g:link>
                            </td>
                            <td>
                                ${fieldValue(bean: gradeHorasDiaInstance, field: "gradeDia")}
                            </td>
                            <td><g:link action="show" id="${gradeHorasDiaInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar" />
                                <g:link action="edit" id="${gradeHorasDiaInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar" /> <g:link
                                    action="delete" id="${gradeHorasDiaInstance.id}"
                                    class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                    onclick="return confirm('Tem certeza?');" />
                             </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${gradeHorasDiaInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
