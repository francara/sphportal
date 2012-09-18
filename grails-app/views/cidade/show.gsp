

<%@ page import="sph.domain.basico.Cidade"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'cidade.label', default: 'Cidade')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-cidade" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list cidade">
                        <g:if test="${cidadeInstance?.descricao}">
                            <li class="fieldcontain"><span id="descricao-label" class="property-label"><g:message
                                        code="cidade.descricao.label" default="Descricao" /></span> <span class="property-value"
                                aria-labelledby="descricao-label"><g:fieldValue bean="${cidadeInstance}" field="descricao" /></span></li>
                        </g:if>
                        <g:if test="${cidadeInstance?.codigo}">
                            <li class="fieldcontain"><span id="codigo-label" class="property-label">
                              <g:message code="cidade.codigo.label" default="Código" /></span> 
                              <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${cidadeInstance}" field="codigo" /></span>
                            </li>
                        </g:if>
                        <g:if test="${cidadeInstance?.uf}">
                            <li class="fieldcontain"><span id="uf-label" class="property-label">
                                <g:message code="cidade.uf.label" default="Uf" /></span> <span class="property-value" aria-labelledby="uf-label">
                                <g:link controller="uf" action="show" id="${cidadeInstance?.uf?.id}">
                                        ${cidadeInstance?.uf?.codigo.encodeAsHTML()}
                                    </g:link></span>
                              </li>
                        </g:if>
                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${cidadeInstance?.id}" />
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
