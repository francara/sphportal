

<%@ page import="sph.domain.cliente.Cliente"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="sph">
<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <script language="javascript">
$().ready(function() {    
      $('#numero').setMask('integer')    
      $('#cep').setMask('cep')    
});
</script>

    <sphlay:nav action="show" />

    <div id="show-cliente" class="grid_16">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>

        <div class="block" id="forms">
            <g:form>
                <fieldset>
                    <legend>Detalhamento</legend>
                    <ol class="property-list cliente">
                        <g:if test="${clienteInstance?.razaoSocial}">
                            <li class="fieldcontain"><span id="razaoSocial-label" class="property-label"><g:message
                                        code="cliente.razaoSocial.label" default="Razao Social" /></span> <span class="property-value"
                                aria-labelledby="razaoSocial-label"><g:fieldValue bean="${clienteInstance}" field="razaoSocial" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.nomeFantasia}">
                            <li class="fieldcontain"><span id="nomeFantasia-label" class="property-label"><g:message
                                        code="cliente.nomeFantasia.label" default="Nome Fantasia" /></span> <span class="property-value"
                                aria-labelledby="nomeFantasia-label"><g:fieldValue bean="${clienteInstance}" field="nomeFantasia" /></span>
                            </li>
                        </g:if>

                        <g:if test="${clienteInstance?.logradouro}">
                            <li class="fieldcontain"><span id="logradouro-label" class="property-label"><g:message
                                        code="cliente.logradouro.label" default="Logradouro" /></span> <span class="property-value"
                                aria-labelledby="logradouro-label"><g:fieldValue bean="${clienteInstance}" field="logradouro" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.bairro}">
                            <li class="fieldcontain"><span id="bairro-label" class="property-label"><g:message
                                        code="cliente.bairro.label" default="Bairro" /></span> <span class="property-value"
                                aria-labelledby="bairro-label"><g:fieldValue bean="${clienteInstance}" field="bairro" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.complemento}">
                            <li class="fieldcontain"><span id="complemento-label" class="property-label"><g:message
                                        code="cliente.complemento.label" default="Complemento" /></span> <span class="property-value"
                                aria-labelledby="complemento-label"><g:fieldValue bean="${clienteInstance}" field="complemento" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.inscricaoEstadual}">
                            <li class="fieldcontain"><span id="inscricaoEstadual-label" class="property-label"><g:message
                                        code="cliente.inscricaoEstadual.label" default="Inscricao Estadual" /></span> <span class="property-value"
                                aria-labelledby="inscricaoEstadual-label"><g:fieldValue bean="${clienteInstance}"
                                        field="inscricaoEstadual" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.inscricaoMunicipal}">
                            <li class="fieldcontain"><span id="inscricaoMunicipal-label" class="property-label"><g:message
                                        code="cliente.inscricaoMunicipal.label" default="Inscricao Municipal" /></span> <span
                                class="property-value" aria-labelledby="inscricaoMunicipal-label"><g:fieldValue
                                        bean="${clienteInstance}" field="inscricaoMunicipal" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.ativo}">
                            <li class="fieldcontain"><span id="ativo-label" class="property-label"><g:message
                                        code="cliente.ativo.label" default="Ativo" /></span> <span class="property-value"
                                aria-labelledby="ativo-label"><g:formatBoolean boolean="${clienteInstance?.ativo}" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.cep}">
                            <li class="fieldcontain"><span id="cep-label" class="property-label"><g:message
                                        code="cliente.cep.label" default="Cep" /></span> <span class="property-value" aria-labelledby="cep-label">
                                    <g:fieldValue id="cep" bean="${clienteInstance}" field="cep" />
                            </span></li>

                        </g:if>

                        <g:if test="${clienteInstance?.cidade}">
                            <li class="fieldcontain"><span id="cidade-label" class="property-label"><g:message
                                        code="cliente.cidade.label" default="Cidade" /></span> <span class="property-value"
                                aria-labelledby="cidade-label"> ${clienteInstance.cidade.descricao} </span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.cnpjCorporativo}">
                            <li class="fieldcontain"><span id="cnpjCorporativo-label" class="property-label"><g:message
                                        code="cliente.cnpjCorporativo.label" default="Cnpj Corporativo" /></span> <span class="property-value"
                                aria-labelledby="cnpjCorporativo-label"><g:fieldValue bean="${clienteInstance}"
                                        field="cnpjCorporativo" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.cnpjDigito}">
                            <li class="fieldcontain"><span id="cnpjDigito-label" class="property-label"><g:message
                                        code="cliente.cnpjDigito.label" default="Cnpj Digito" /></span> <span class="property-value"
                                aria-labelledby="cnpjDigito-label"><g:fieldValue bean="${clienteInstance}" field="cnpjDigito" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.cnpjFilial}">
                            <li class="fieldcontain"><span id="cnpjFilial-label" class="property-label"><g:message
                                        code="cliente.cnpjFilial.label" default="Cnpj Filial" /></span> <span class="property-value"
                                aria-labelledby="cnpjFilial-label"><g:fieldValue bean="${clienteInstance}" field="cnpjFilial" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.contatos}">
                            <li class="fieldcontain"><span id="contatos-label" class="property-label"><g:message
                                        code="cliente.contatos.label" default="Contatos" /></span> <g:each in="${clienteInstance.contatos}"
                                    var="c">
                                    <span class="property-value" aria-labelledby="contatos-label"><g:link controller="contato"
                                            action="show" id="${c.id}">
                                            ${c?.encodeAsHTML()}
                                        </g:link></span>
                                </g:each></li>
                        </g:if>

                        <g:if test="${clienteInstance?.numero}">
                            <li class="fieldcontain"><span id="numero-label" class="property-label"><g:message
                                        code="cliente.numero.label" default="Numero" /></span> <span class="property-value"
                                aria-labelledby="numero-label"><g:fieldValue bean="${clienteInstance}" field="numero" /></span></li>
                        </g:if>

                        <g:if test="${clienteInstance?.uf}">
                            <li class="fieldcontain"><span id="uf-label" class="property-label"><g:message
                                        code="cliente.uf.label" default="Uf" /></span> <span class="property-value" aria-labelledby="uf-label">
                                          ${clienteInstance.uf.codigo}
                                        </span></li>
                        </g:if>

                    </ol>
                </fieldset>

                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${clienteInstance?.id}" />
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
