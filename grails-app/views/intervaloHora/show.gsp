

<%@ page import="sph.domain.cliente.grade.IntervaloHora"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'intervaloHora.label', default: 'IntervaloHora')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${conversation}">
        <sphlay:navbck action="show" backcontroller="${backcontroller}" backaction="${backaction}" backid="${backid}" />
    </g:if>
    <g:else>
        <sphlay:nav action="show" />
    </g:else>
    <div id="show-intervaloHora" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list intervaloHora">

                        <g:if test="${intervaloHoraInstance?.horaFim}">
                            <li class="fieldcontain"><span id="horaFim-label" class="property-label"><g:message
                                        code="intervaloHora.horaFim.label" default="Hora Fim" /></span> <span class="property-value"
                                aria-labelledby="horaFim-label"><g:fieldValue bean="${intervaloHoraInstance}" field="horaFim" /></span></li>
                        </g:if>

                        <g:if test="${intervaloHoraInstance?.horaInicio}">
                            <li class="fieldcontain"><span id="horaInicio-label" class="property-label"><g:message
                                        code="intervaloHora.horaInicio.label" default="Hora Inicio" /></span> <span class="property-value"
                                aria-labelledby="horaInicio-label"><g:fieldValue bean="${intervaloHoraInstance}" field="horaInicio" /></span>

                            </li>
                        </g:if>

                        <g:if test="${intervaloHoraInstance?.percentualExtra}">
                            <li class="fieldcontain"><span id="percentualExtra-label" class="property-label"><g:message
                                        code="intervaloHora.percentualExtra.label" default="Percentual Extra" /></span> <span
                                class="property-value" aria-labelledby="percentualExtra-label"><g:fieldValue
                                        bean="${intervaloHoraInstance}" field="percentualExtra" /></span></li>
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${intervaloHoraInstance?.id}" />
                    <g:if test="${conversation}">
                        <g:hiddenField name="conversation" value="1" />
                        <g:hiddenField name="backcontroller" value="${backcontroller}" />
                        <g:hiddenField name="backaction" value="${backaction}" />
                        <g:hiddenField name="backid" value="${backid}" />
                    </g:if>

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
