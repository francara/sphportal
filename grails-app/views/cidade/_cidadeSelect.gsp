<%@ page import="sph.domain.basico.Cidade"%>

<label for="cidade"> <g:message code="cliente.cidade.label" default="Cidade" />
</label>

<g:select style="width:100px" id="cidade" name="cidade.id" from="${cidadeInstanceList}" optionKey="id"
    optionValue="descricao" />