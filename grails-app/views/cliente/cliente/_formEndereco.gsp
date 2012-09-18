<script language="javascript" >
$().ready(function() {    
      $('#numero').setMask('integer')    
      $('#cep').setMask('cep')    
});
</script>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cep', 'error')}">
    <label for="cep"> <g:message code="cliente.cep.label" default="Cep" /> 
    </label>
    <g:field type="number" name="cep" value="${fieldValue(bean: clienteInstance, field: 'cep')}"/>
</div>
<div class="grid_5">
    <g:submitToRemote action="buscarCep" update="fromCepDiv" value="Adicionar CEP"
    class="fg-button ui-state-default fg-button-icon-left ui-corner-all" />
</div>
<div class="clear"></div>

<div id="fromCepDiv">
<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'logradouro', 'error')} ">
    <label for="logradouro"> <g:message code="cliente.logradouro.label" default="Logradouro" />
    </label>
    <g:textField name="logradouro" maxlength="20" value="${clienteInstance?.logradouro}" />
</div>

<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'numero', 'error')}">
    <label for="numero"> <g:message code="cliente.numero.label" default="Numero" /> 
    </label>
    <g:field type="number" name="numero" value="${fieldValue(bean: clienteInstance, field: 'numero')}" />
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


<div class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'uf', 'error')} ">
    <label for="uf"> <g:message code="cliente.uf.label" default="Uf" />
    </label>
  <g:select style="width:100px" id="uf" name="uf.id" from="${sph.domain.basico.Uf.list()}"  
      optionKey="id" required="" value="${clienteInstance?.uf?.id}" optionValue="codigo" class="many-to-one"
      noSelection="${['null':'Select One...']}"      
      onchange="${remoteFunction(controller:'cidade', action: 'listarPorUf', update: [success: 'cidadePn'],
                       params: '\'uf=\' + this.value')}" 
      />
</div>
<div id="cidadePn" class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cidade', 'error')}">
    <label for="cidade"> <g:message code="cliente.cidade.label" default="Cidade" />
    </label>  
    <g:select style="width:100px" id="cidade" name="cidade.id" from="${sph.domain.basico.Cidade.list()}"  
      optionKey="id" required="" value="${clienteInstance?.cidade?.id}" optionValue="descricao" class="many-to-one"/>
</div>
</div> <!-- fromCep -->
