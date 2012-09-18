

<%@ page import="sph.domain.cliente.grade.GradeDia"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'gradeDia.label', default: 'GradeDia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

    <g:if test="${conversation}">
        <sphlay:navbck action="show" backcontroller="${backcontroller}" backaction="${backaction}" backid="${backid}" />
    </g:if>
    <g:else>
        <sphlay:nav action="show" />
    </g:else>

    <div id="show-gradeDia" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list gradeDia">

                        <g:if test="${gradeDiaInstance?.descricao}">
                            <li class="fieldcontain"><span id="descricao-label" class="property-label"><g:message
                                        code="gradeDia.descricao.label" default="Descricao" /></span> <span class="property-value"
                                aria-labelledby="descricao-label"><g:fieldValue bean="${gradeDiaInstance}" field="descricao" /></span></li>
                        </g:if>

                        <g:if test="${gradeDiaInstance?.diaUtil}">
                            <li class="fieldcontain"><span id="diaUtil-label" class="property-label"><g:message
                                        code="gradeDia.diaUtil.label" default="Dia Util" /></span> <span class="property-value"
                                aria-labelledby="diaUtil-label"><g:formatBoolean boolean="${gradeDiaInstance?.diaUtil}" /></span></li>
                        </g:if>

                        <g:if test="${gradeDiaInstance?.intervalos}">
                            <li class="fieldcontain"><span id="intervalos-label" class="property-label"><g:message
                                        code="gradeDia.intervalos.label" default="Intervalos" /></span> <g:each
                                    in="${gradeDiaInstance.intervalos}" var="i">
                                    <span class="property-value" aria-labelledby="intervalos-label"><g:link
                                            controller="diaSemanaIntervalo" action="show" id="${i.id}">
                                            ${i?.encodeAsHTML()}
                                        </g:link></span>
                                </g:each></li>
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${gradeDiaInstance?.id}" />
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
