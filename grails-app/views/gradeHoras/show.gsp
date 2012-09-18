

<%@ page import="sph.domain.cliente.grade.GradeHoras"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeHoras.label', default: 'GradeHoras')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-gradeHoras" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <g:form>
            <div class="block" id="forms">
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list gradeHoras">

                        <g:if test="${gradeHorasInstance?.descricao}">
                            <li class="fieldcontain"><span id="descricao-label" class="property-label"><g:message
                                        code="gradeHoras.descricao.label" default="Descricao" /></span> <span class="property-value"
                                aria-labelledby="descricao-label"><g:fieldValue bean="${gradeHorasInstance}" field="descricao" /></span></li>
                        </g:if>
                    </ol>
                </fieldset>
            </div> <!--  Block  -->

            <div class="box">
                <h2>Intervalo Dias</h2>
                <tmpl:gradeDia gradeHorasItemList="${gradeHorasItemList}" />
            </div>

            <fieldset class="buttons">
                <g:hiddenField name="id" value="${gradeHorasInstance?.id}" />
                <g:actionSubmit class="nav-button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                <g:actionSubmit class="nav-button" action="delete"
                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
    <!-- grid_16  -->
</body>
</html>
