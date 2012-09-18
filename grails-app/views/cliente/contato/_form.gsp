<%@ page import="sph.domain.cliente.Contato"%>

<script language="javascript" >
$().ready(function() {    
      $('#cpf').setMask('cpf')      
});
</script>


<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'nome', 'error')} ">
    <label for="nome"> <g:message code="contato.nome.label" default="Nome" />
    </label>
    <g:textField name="nome" required=""  autofocus="" maxlength="45" value="${contatoInstance?.nome}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'apelido', 'error')} ">
    <label for="apelido"> <g:message code="contato.apelido.label" default="Apelido" />

    </label>
    <g:textField name="apelido" maxlength="25" value="${contatoInstance?.apelido}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'cpf', 'error')}">
    <label for="cpf"> <g:message code="contato.cpf.label" default="Cpf" /> 
    </label>
    <g:textField name="cpf" value="${contatoInstance.cpf()}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'rg', 'error')}">
    <label for="rg"> <g:message code="contato.rg.label" default="Rg" /> 
    </label>
    <g:field type="number" name="rg" value="${fieldValue(bean: contatoInstance, field: 'rg')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'email', 'error')} ">
    <label for="email"> <g:message code="contato.email.label" default="Email" />

    </label>
    <g:field type="email" name="email" value="${contatoInstance?.email}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'cliente', 'error')} required">
    <label for="cliente"> <g:message code="contato.cliente.label" default="Cliente" /> <span class="required-indicator">*</span>
    </label>
    <g:select id="cliente" name="cliente.id" from="${sph.domain.cliente.Cliente.list()}" required=""
        optionKey="id"  optionValue="nomeFantasia"
        value="${contatoInstance?.cliente?.id}" class="many-to-one" style="width:180px" />
</div>

<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'departamento', 'error')} ">
    <label for="departamento"> <g:message code="contato.departamento.label" default="Departamento" />

    </label>
    <g:textField name="departamento" value="${contatoInstance?.departamento}" />
</div>


<div class="fieldcontain ${hasErrors(bean: contatoInstance, field: 'fones', 'error')} ">
        <label for="phones"><g:message code="contact.phones.label" default="Telefones" /></label>
        <!-- Render the phones template (_phones.gsp) here -->
        <g:render template="/cliente/contato/fones" model="['contatoInstance':contatoInstance]" />
        <!-- Render the phones template (_phones.gsp) here -->        
</div>
