
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

<div class="grid_5">
<g:if test="${flash.cepMessage}">
    <div class="message" role="status">
        ${flash.cepMessage}
    </div>
</g:if>
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
      optionKey="id" required="" value="${cepInstance?.cidade?.uf?.id}" optionValue="codigo" class="many-to-one"
      noSelection="${['null':'Select One...']}"      
      onchange="${remoteFunction(controller:'cidade', action: 'listarPorUf', update: [success: 'cidadePn'],
                       params: '\'uf=\' + this.value')}" 
      />
</div>
<div id="cidadePn" class="grid_5 fieldcontain ${hasErrors(bean: clienteInstance, field: 'cidade', 'error')}">
    <label for="cidade"> <g:message code="cliente.cidade.label" default="Cidade" />
    </label>  
    <g:select style="width:100px" id="cidade" name="cidade.id" from="${sph.domain.basico.Cidade.list()}"  
      optionKey="id" required="" value="${cepInstance?.cidade?.id}" optionValue="descricao" class="many-to-one"/>
</div>