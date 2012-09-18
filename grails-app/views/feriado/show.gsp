

<%@ page import="sph.domain.basico.Feriado"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'feriado.label', default: 'Feriado')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-feriado" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list feriado">
                        <g:if test="${feriadoInstance?.cidade}">
                            <li class="fieldcontain"><span id="cidade-label" class="property-label"><g:message
                                        code="feriado.cidade.label" default="Cidade" /></span> <span class="property-value"
                                aria-labelledby="cidade-label"><g:link controller="cidade" action="show"
                                        id="${feriadoInstance?.cidade?.id}">
                                        ${feriadoInstance?.cidade?.descricao}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${feriadoInstance?.uf}">
                            <li class="fieldcontain"><span id="uf-label" class="property-label"><g:message
                                        code="feriado.uf.label" default="Uf" /></span> <span class="property-value" aria-labelledby="uf-label"><g:link
                                        controller="uf" action="show" id="${feriadoInstance?.uf?.id}">
                                        ${feriadoInstance?.uf?.codigo}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${feriadoInstance?.data}">
                            <li class="fieldcontain"><span id="data-label" class="property-label"><g:message
                                        code="feriado.data.label" default="Data" /></span> <span class="property-value"
                                aria-labelledby="data-label">${feriadoInstance?.data?.format('dd/MM/yyyy')}</span></li>
                        </g:if>

                        <g:if test="${feriadoInstance?.nacional}">
                            <li class="fieldcontain"><span id="nacional-label" class="property-label"><g:message
                                        code="feriado.nacional.label" default="Nacional" /></span> <span class="property-value"
                                aria-labelledby="nacional-label"><g:formatBoolean boolean="${feriadoInstance?.nacional}" /></span></li>
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${feriadoInstance?.id}" />
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
