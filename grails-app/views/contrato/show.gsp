

<%@ page import="sph.domain.cliente.Contrato"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-contrato" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list contrato">

                        <g:if test="${contratoInstance?.cliente}">
                            <li class="fieldcontain"><span id="cliente-label" class="property-label"><g:message
                                        code="contrato.cliente.label" default="Cliente" /></span> <span class="property-value"
                                aria-labelledby="cliente-label"><g:link controller="cliente" action="show"
                                        id="${contratoInstance?.cliente?.id}">
                                        ${contratoInstance?.cliente?.nomeFantasia}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${contratoInstance?.dataInicio}">
                            <li class="fieldcontain"><span id="dataInicio-label" class="property-label"><g:message
                                        code="contrato.descricao.label" default="Data Inicio" /></span> 
                                <span class="property-value" aria-labelledby="dataInicio-label">
                                    <g:fieldValue bean="${contratoInstance}" field="dataInicio" />
                                </span>
                             </li>
                        </g:if>

                        <g:if test="${contratoInstance?.descricao}">
                            <li class="fieldcontain"><span id="descricao-label" class="property-label"><g:message
                                        code="contrato.descricao.label" default="Descricao" /></span> 
                                <span class="property-value" aria-labelledby="descricao-label">
                                    <g:fieldValue bean="${contratoInstance}" field="descricao" />
                                </span>
                             </li>
                        </g:if>

                        <g:if test="${contratoInstance?.vigencias}">
                            <div style="margin-top:20px">
                                <tmpl:vigencias contratoVigenciaInstanceList="${contratoInstance.vigencias}" />
                            </div>                            
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${contratoInstance?.id}" />
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
