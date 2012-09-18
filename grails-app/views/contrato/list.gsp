<%@ page import="sph.domain.cliente.Contrato"%>
<%@ page import="sph.domain.cliente.ContratoVigencia"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'contrato.label', default: 'Contrato')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />

    <div class="clear"></div>
    <div class="grid_16">

        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div id="filtroClientePn" style="margin-bottom:10px">
            <g:form id="filtroClienteForm" method="get" action="filtrar">
                <fieldset class="form">
                    <legend>Filtro</legend>                                    
                    <g:render template="/cliente/cliente/filtroCliente" />
                    
                    <div style="float:right;position:relative;top:-2em">
                    <g:actionSubmit class="fg-button ui-state-default fg-button-icon-left ui-corner-all" action="filtrar"
                        value="Filtrar" />      
                    <!--               
                    <g:link action="filtrar" class="fg-button ui-state-default fg-button-icon-left ui-corner-all" onclick="document.forms[0].submit();return false;">
                        <span class="ui-icon ui-icon-circle-plus"></span> Filtrar
                    </g:link>
                    -->
                    <g:link class="fg-button ui-state-default fg-button-icon-left ui-corner-all" onclick="document.forms[0].clear();return false;">
                        <span class="ui-icon ui-icon-circle-plus"></span> Limpar
                    </g:link>
                    </div>                    
                </fieldset>            
            </g:form>
        </div>
    
    
        <div id="list-contrato" class="content scaffold-list" role="main">
            <table>
                <thead>
                    <tr>
                        <th><g:message code="contrato.cliente.label" default="Cliente" /></th>
                        <g:sortableColumn property="descricao" title="${message(code: 'contrato.descricao.label', default: 'Descricao')}" />
                        <g:sortableColumn property="qtHoras" title="${message(code: 'contratoVigencia.qtHoras.label', default:"Horas")}" />
                        <g:sortableColumn property="dataInicio" title="${message(code: 'contratoVigencia.dataInicio.label', default: 'Inicio')}" />
                        <g:sortableColumn property="dataTermino" title="${message(code: 'contratoVigencia.dataTermino.label', default: 'Termino')}" />
                        <th width=10%></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${contratoInstanceList}" status="i" var="contratoInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td width=20%><g:link action="show" id="${contratoInstance.id}">
                                    ${fieldValue(bean: contratoInstance, field: "cliente.nomeFantasia")}
                                </g:link></td>
                            <td width=25%>${fieldValue(bean: contratoInstance, field: "descricao")}</td>
                            <td width=5%>${contratoInstance.getContratoVigente().qtHoras} </td>
                            <td width=20%><joda:format value="${contratoInstance.getContratoVigente().dataInicio}" pattern="dd/MM/yyyy"/></td>
                            <td width=20%>${contratoInstance.getContratoVigente().dataTermino?.format('dd/MM/yyyy')}</td>
                            <td>
                              <g:link action="show" id="${contratoInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${contratoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${contratoInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"/>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${contratoInstanceTotal}" />
            </div>
        </div>
    </div>
    <!-- grid_16 -->
</body>
</html>
