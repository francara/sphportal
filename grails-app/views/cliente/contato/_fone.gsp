<%@ page import="sph.domain.cliente.Fone" %>

<div id="fone${i}" class="fone-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='fones[${i}].id' value='${fone?.id}'/>
    <g:hiddenField name='fones[${i}].deleted' value='false'/>
    <g:hiddenField name='fones[${i}].new' value="${fone?.id == null?'true':'false'}"/>
    
    <g:textField name='fones[${i}].telefone' value='${fone?.telefone}' />    
    <g:select name="fones[${i}].tipo"
        from="${Fone.FoneType.values()}"
        optionKey="key"
        optionValue="key"
        value = "${fone?.tipo?.key}"/>
    
    <span class="del-fone">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}" 
            style="vertical-align:middle;"/>
    </span>
</div>
