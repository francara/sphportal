<%@ page import="sph.domain.cliente.Cliente"%>


<div class="clear"></div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'razaoSocial', 'error')} ">
    <label for="razaoSocial"> <g:message code="cliente.razaoSocial.label" default="Razao Social" />
    </label>
    <g:textField name="razaoSocial" maxlength="20" value="${clienteInstance?.razaoSocial}" />
</div>

<div class="grid_5 suffix_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'nomeFantasia', 'error')} ">
    <label for="nomeFantasia"> <g:message code="cliente.nomeFantasia.label" default="Nome Fantasia" />
    </label>
    <g:textField name="nomeFantasia" maxlength="20" value="${clienteInstance?.nomeFantasia}" />
</div>
<div class="clear"></div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjCorporativo', 'error')} required">
    <label for="cnpjCorporativo"> <g:message code="cliente.cnpjCorporativo.label" default="Cnpj Corporativo" /> <span
        class="required-indicator">*</span>
    </label>
    <g:field type="number" name="cnpjCorporativo" required="" value="${fieldValue(bean: clienteInstance, field: 'cnpjCorporativo')}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjFilial', 'error')} required">
    <label for="cnpjFilial"> <g:message code="cliente.cnpjFilial.label" default="Cnpj Filial" /> <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="cnpjFilial" required="" value="${fieldValue(bean: clienteInstance, field: 'cnpjFilial')}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjDigito', 'error')} required">
    <label for="cnpjDigito"> <g:message code="cliente.cnpjDigito.label" default="Cnpj Digito" /> <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="cnpjDigito" required="" value="${fieldValue(bean: clienteInstance, field: 'cnpjDigito')}" />
</div>
<div class="clear"></div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'inscricaoEstadual', 'error')} ">
    <label for="inscricaoEstadual"> <g:message code="cliente.inscricaoEstadual.label" default="Inscricao Estadual" />

    </label>
    <g:textField name="inscricaoEstadual" maxlength="20" value="${clienteInstance?.inscricaoEstadual}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'inscricaoMunicipal', 'error')} ">
    <label for="inscricaoMunicipal"> <g:message code="cliente.inscricaoMunicipal.label" default="Inscricao Municipal" />

    </label>
    <g:textField name="inscricaoMunicipal" maxlength="20" value="${clienteInstance?.inscricaoMunicipal}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'ativo', 'error')} ">
    <label for="ativo"> <g:message code="cliente.ativo.label" default="Ativo" />

    </label>
    <g:checkBox name="ativo" value="${clienteInstance?.ativo}" />
</div>

<div class="clear"></div>

<div class="grid_12 prefix_2 suffix_2">
    <div class="block">
        <legend>Endereço</legend>
        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'logradouro', 'error')} ">
            <label for="logradouro"> <g:message code="cliente.logradouro.label" default="Logradouro" />
            </label>
            <g:textField name="logradouro" maxlength="20" value="${clienteInstance?.logradouro}" />
        </div>

        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'numero', 'error')} required">
            <label for="numero"> <g:message code="cliente.numero.label" default="Numero" /> <span class="required-indicator">*</span>
            </label>
            <g:field type="number" name="numero" required="" value="${fieldValue(bean: clienteInstance, field: 'numero')}" />
        </div>
        <div class="clear"></div>

        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'complemento', 'error')} ">
            <label for="complemento"> <g:message code="cliente.complemento.label" default="Complemento" />
            </label>
            <g:textField name="complemento" maxlength="20" value="${clienteInstance?.complemento}" />
        </div>

        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'bairro', 'error')} ">
            <label for="bairro"> <g:message code="cliente.bairro.label" default="Bairro" />
            </label>
            <g:textField name="bairro" maxlength="20" value="${clienteInstance?.bairro}" />
        </div>
        <div class="clear"></div>

        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cep', 'error')} required">
            <label for="cep"> <g:message code="cliente.cep.label" default="Cep" /> <span class="required-indicator">*</span>
            </label>
            <g:field type="number" name="cep" required="" value="${fieldValue(bean: clienteInstance, field: 'cep')}" />
        </div>
        <div class="clear"></div>

        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cidade', 'error')} ">
            <label for="cidade"> <g:message code="cliente.cidade.label" default="Cidade" />
            </label>
            <g:textField name="cidade" value="${clienteInstance?.cidade}" />
        </div>
        <div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'uf', 'error')} ">
            <label for="uf"> <g:message code="cliente.uf.label" default="Uf" />
            </label>
            <g:textField name="uf" value="${clienteInstance?.uf}" />
        </div>
    </div>
</div><!-- Box endereço -->
<div class="clear"></div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'contatos', 'error')} ">
    <label for="contatos"> <g:message code="cliente.contatos.label" default="Contatos" />
    </label>

    <ul class="one-to-many">
        <g:each in="${clienteInstance?.contatos?}" var="c">
            <li><g:link controller="contato" action="show" id="${c.id}">
                    ${c?.encodeAsHTML()}
                </g:link></li>
        </g:each>
        <li class="add"><g:link controller="contato" action="create" params="['cliente.id': clienteInstance?.id]">
                ${message(code: 'default.add.label', args: [message(code: 'contato.label', default: 'Contato')])}
            </g:link></li>
    </ul>

</div>

