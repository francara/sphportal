

<%@ page import="sph.domain.cliente.CentroDeCusto"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'centroDeCusto.label', default: 'CentroDeCusto')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-centroDeCusto" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list centroDeCusto">

                        <g:if test="${centroDeCustoInstance?.codigo}">
                            <li class="fieldcontain"><span id="codigo-label" class="property-label"><g:message
                                        code="centroDeCusto.codigo.label" default="Codigo" /></span> <span class="property-value"
                                aria-labelledby="codigo-label"><g:fieldValue bean="${centroDeCustoInstance}" field="codigo" /></span></li>
                        </g:if>
                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${centroDeCustoInstance?.id}" />
                    <g:actionSubmit class="nav-button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="nav-button" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        <!--  Block  -->
    </div>
    <!-- grid_16  -->
</body>
</html>
