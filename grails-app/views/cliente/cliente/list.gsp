
<%@ page import="sph.domain.cliente.Cliente" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="sph">
    <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <sphlay:nav action="list" />
    
    <div class="clear"></div>
    <div class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div id="filtroClientePn" style="margin-bottom:10px">
            <g:form id="filtroClienteForm" method="get" action="filtrar">
                <fieldset class="form">
                    <legend>Filtro</legend>                                    
                    <g:render template="cliente/filtroCliente" />
                    
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
            
    <div id="list-cliente" class="content scaffold-list" role="main">

        
        
        <table>
            <thead>
                <tr>
                        <g:sortableColumn property="razaoSocial" title="${message(code: 'cliente.razaoSocial.label', default: 'Razao Social')}" />
                        <g:sortableColumn property="nomeFantasia" title="${message(code: 'cliente.nomeFantasia.label', default: 'Nome Fantasia')}" />
                        <g:sortableColumn property="logradouro" title="${message(code: 'cliente.logradouro.label', default: 'Logradouro')}" />
                        <g:sortableColumn property="bairro" title="${message(code: 'cliente.bairro.label', default: 'Bairro')}" />
                        <g:sortableColumn property="complemento" title="${message(code: 'cliente.complemento.label', default: 'Complemento')}" />
                        <g:sortableColumn property="inscricaoEstadual" title="${message(code: 'cliente.inscricaoEstadual.label', default: 'Inscricao Estadual')}" />
                        <th width=10%></th>
                    </tr>
            </thead>
            <tbody>
                <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${clienteInstance.id}">
                                    ${fieldValue(bean: clienteInstance, field: "razaoSocial")}
                                </g:link></td>
                            <td>
                                ${fieldValue(bean: clienteInstance, field: "nomeFantasia")}
                            </td>
                            <td>
                                ${fieldValue(bean: clienteInstance, field: "logradouro")}
                            </td>
                            <td>
                                ${fieldValue(bean: clienteInstance, field: "bairro")}
                            </td>
                            <td>
                                ${fieldValue(bean: clienteInstance, field: "complemento")}
                            </td>
                            <td>
                                ${fieldValue(bean: clienteInstance, field: "inscricaoEstadual")}
                            </td>
                            <td>
                              <g:link action="show" id="${clienteInstance.id}" class="ui-state-default ui-corner-all ui-icon ui-icon-document" style="float:left;" title="Detalhar"/>                            
                              <g:link action="edit" id="${clienteInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-pencil" style="float:left" title="Editar"/>
                              <g:link action="delete" id="${clienteInstance.id}"  class="ui-state-default ui-corner-all ui-icon ui-icon-trash" title="Remover"
                                onclick="return confirm('Tem certeza?');"/>
                            </td>
                        </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${clienteInstanceTotal}" />
        </div>
    </div>
    </div> <!-- grid_16 -->
</body>
</html>
