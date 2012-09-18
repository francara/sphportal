<%@ page import="sph.domain.cliente.Cliente"%>

<script language="javascript" >
$().ready(function() {    
      $('#inscricaoEstadual').setMask('integer')
      $('#inscricaoMunicipal').setMask('integer')
      $('#cnpj').setMask('cnpj')      
});
</script>

<div class="clear"></div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'razaoSocial', 'error')} required">
    <label for="razaoSocial"> <g:message code="cliente.razaoSocial.label" default="Razao Social" />
        <span class="required-indicator">*</span>      
    </label>
    <g:textField name="razaoSocial" required="" maxlength="20" value="${clienteInstance?.razaoSocial}" />
</div>

<div class="grid_5 suffix_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'nomeFantasia', 'error')} required">
    <label for="nomeFantasia"> <g:message code="cliente.nomeFantasia.label" default="Nome Fantasia" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nomeFantasia" required="" maxlength="20" value="${clienteInstance?.nomeFantasia}" />
</div>
<div class="clear"></div>

<!--
<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjCorporativo', 'error')} required">
    <label for="cnpjCorporativo"> <g:message code="cliente.cnpjCorporativo.label" default="Cnpj Corporativo" /> 
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="cnpjCorporativo" required="" value="${fieldValue(bean: clienteInstance, field: 'cnpjCorporativo')}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjFilial', 'error')} required">
    <label for="cnpjFilial"> <g:message code="cliente.cnpjFilial.label" default="Cnpj Filial" /> <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="cnpjFilial" value="${fieldValue(bean: clienteInstance, field: 'cnpjFilial')}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cnpjDigito', 'error')} required">
    <label for="cnpjDigito"> <g:message code="cliente.cnpjDigito.label" default="Cnpj Digito" /> 
        <span class="required-indicator">*</span>    
    </label>
    <g:field type="number" name="cnpjDigito" required="" value="${fieldValue(bean: clienteInstance, field: 'cnpjDigito')}" />
</div>
-->
<div class="clear"></div>

<div class="grid_5 fieldcontain required">
    <label for="cnpj"> Cnpj 
        <span class="required-indicator">*</span>    
    </label>
    <g:textField name="cnpj" required="" value="${clienteInstance.cnpj()}" />
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

<g:hiddenField name="ativo" value="on" />
<!--
<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'ativo', 'error')} ">
    <label for="ativo"> <g:message code="cliente.ativo.label" default="Ativo" />

    </label>
    <g:checkBox name="ativo" value="${clienteInstance?.ativo}" />
</div>
-->

<div class="clear"></div>

<div class="grid_15" style="margin-top: 20px">
    <div class="box">
        <h2>Contatos</h2>
            <tmpl:cliente/contatos contatoInstanceList="${clienteInstance.contatos}" />
            <g:if test="${actionName == 'edit'}">
                <g:link controller="contato" action="create" class="fg-button ui-state-default fg-button-icon-left ui-corner-all"
                    style="float:right; margin-top:10px">
                    <span class="ui-icon ui-icon-circle-plus"></span> Adicionar Contatos
                </g:link>
            </g:if>
    </div>
</div>

