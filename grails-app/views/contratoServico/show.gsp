

<%@ page import="sph.domain.cliente.ContratoServico"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contratoServico.label', default: 'ContratoServico')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <sphlay:nav action="show" />

    <div id="show-contratoServico" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list contratoServico">

                        <g:if test="${contratoServicoInstance?.catalogo}">
                            <li class="fieldcontain"><span id="catalogo-label" class="property-label"><g:message
                                        code="contratoServico.catalogo.label" default="Catalogo" /></span> <span class="property-value"
                                aria-labelledby="catalogo-label"><g:link controller="catalogo" action="show"
                                        id="${contratoServicoInstance?.catalogo?.id}">
                                        ${contratoServicoInstance?.catalogo?.descricao}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${contratoServicoInstance?.contrato}">
                            <li class="fieldcontain"><span id="contrato-label" class="property-label"><g:message
                                        code="contratoServico.contrato.label" default="Contrato" /></span> <span class="property-value"
                                aria-labelledby="contrato-label"><g:link controller="contrato" action="show"
                                        id="${contratoServicoInstance?.contrato?.id}">
                                        ${contratoServicoInstance?.contrato?.descricao}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${contratoServicoInstance?.descricao}">
                            <li class="fieldcontain"><span id="descricao-label" class="property-label"><g:message
                                        code="contratoServico.descricao.label" default="Descricao" /></span> <span class="property-value"
                                aria-labelledby="descricao-label"><g:fieldValue bean="${contratoServicoInstance}" field="descricao" /></span>

                            </li>
                        </g:if>

                        <g:if test="${contratoServicoInstance?.prazo}">
                            <li class="fieldcontain"><span id="prazo-label" class="property-label"><g:message
                                        code="contratoServico.prazo.label" default="Prazo" /></span> <span class="property-value"
                                aria-labelledby="prazo-label"><g:link controller="prazoAtendimento" action="show"
                                        id="${contratoServicoInstance?.prazo?.id}">
                                        ${contratoServicoInstance?.prazo?.encodeAsHTML()}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${contratoServicoInstance?.prioridade}">
                            <li class="fieldcontain"><span id="prioridade-label" class="property-label"><g:message
                                        code="contratoServico.prioridade.label" default="Prioridade" /></span> <span class="property-value"
                                aria-labelledby="prioridade-label"><g:link controller="prioridade" action="show"
                                        id="${contratoServicoInstance?.prioridade?.id}">
                                        ${contratoServicoInstance?.prioridade?.descricao}
                                    </g:link></span></li>
                        </g:if>

                        <g:if test="${contratoServicoInstance?.qtMinimaLactoMinutos}">
                            <li class="fieldcontain"><span id="qtMinimaLactoMinutos-label" class="property-label"><g:message
                                        code="contratoServico.qtMinimaLactoMinutos.label" default="Qt Minima Lacto Minutos" /></span> <span
                                class="property-value" aria-labelledby="qtMinimaLactoMinutos-label"><g:fieldValue
                                        bean="${contratoServicoInstance}" field="qtMinimaLactoMinutos" /></span></li>
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${contratoServicoInstance?.id}" />
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
