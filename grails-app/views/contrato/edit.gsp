<%@ page import="sph.domain.cliente.Contrato"%>
<%@ page import="sph.domain.cliente.ContratoServico"%>
<%@ page import="sph.domain.cliente.CentroDeCusto"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="edit" />

    <div id="edit-contrato" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <g:hasErrors bean="${contratoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${contratoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <g:form method="post">
            <div class="block" id="forms">
                <g:hiddenField name="id" value="${contratoInstance?.id}" />
                <g:hiddenField name="version" value="${contratoInstance?.version}" />

                <fieldset class="form">
                    <legend>Edição</legend>
                    <g:render template="form" />
                </fieldset>
            </div> <!--  Block Edição -->

            <!--
            ******************
            ***   CCUSTO   ***
            ******************
             -->
            <div class="box">
                <h2>Centro de Custo</h2>
            </div>
            <!-- 
            <div id="ccustoListDiv" class="grid_5 suffix_3 alpha">
                <tmpl:ccusto contratoCCustoInstanceList="${contratoInstance.contratoCCustos}"/>
            </div>
            <div class="grid_7 omega">
                <label for="ccusto"> <g:message code="contrato.ccusto.label" default="Centro de Custo" />
                </label>
                <g:select name="ccusto" from="${centroDeCustoList}" optionKey="id" optionValue="codigo" style="width:150px" />
                <g:submitToRemote action="addCCusto" update="ccustoListDiv"
                    value="${message(code: 'contrato.button.addCCusto.label', default: 'Associar CCusto')}" />
            </div>
            -->
            <div id="ccustoListDiv" class="grid_12 alpha">
                <tmpl:addCCusto contratoInstance="${contratoInstance}" centroDeCustoList="${centroDeCustoList}"/>            
            </div>
            <div class="grid_3 omega">
                <g:submitToRemote action="addCCusto" update="ccustoListDiv"
                    value="${message(code: 'contrato.button.addCCusto.label', default: 'Associar CCusto')}" />
            </div>
            <div class="clear" style="margin-bottom: 20px"></div>

            <!--
            *********************
            ***   VIGENCIAS   ***
            *********************
             -->
            <div class="box">
                <h2>Vigencias</h2>
                <div class="block">
                    <tmpl:vigencias contratoVigenciaInstanceList="${contratoInstance.vigencias}" />
                </div>
                <div class="block">
                    <fieldset class="form">
                        <legend>Vigência Corrente</legend>
                        <tmpl:vigencia contratoVigenciaInstance="${contratoInstance.getContratoVigente()}" />
                    </fieldset>
                </div>
            </div>
            <div class="clear"></div>

            
            <fieldset class="buttons">
                <g:actionSubmit class="nav-button" action="update"
                    value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit class="nav-button" action="delete"
                    value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                <div class="nav-buttongroup" style="margin-top: 0; margin-bottom: 0">
                    <g:actionSubmit class="nav-button"  action="encerrarVigencia"
                        value="${message(code: 'contrato.button.addSla.label', default: 'Encerrar Vigencia')}" />
                </div>
            </fieldset>
            
            <div class="clear" style="margin-bottom: 20px"></div>

            <!--
            ***************
            ***   SLA   ***
            ***************
             -->
            <div class="box">
                <h2><a id="toggle-search" class="hidden" href="#">SLA</a></h2>
                <div class="grid_13">
                    <tmpl:slas contratoServicoInstanceList="${contratoInstance.slas}" />
                </div>
                <div class="grid_2" style="position: relative; margin-right: 20px; float: right">
                    <g:actionSubmit class="nav-button" action="addSla"
                        value="${message(code: 'contrato.button.addSla.label', default: 'Adicionar SLA')}" />
                </div>
            </div>            
        </g:form>
    </div>
    <!--  grid_16 -->

</body>
</html>
