<%@page import="sph.domain.acesso.PermissaoEnum"%>
<%@ page import="sph.domain.acesso.GrupoAcesso"%>
<%@ page import="sph.domain.acesso.Permissao"%>

<div class="grid_4 alpha">
<span class="property-label">  Administrativo </span>
<select name="permissoesAdministrativoLst" multiple style="width: 100%; height: 110px">
    <g:each in="${PermissaoEnum.administrativo()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>

<div class="grid_4 alpha">
<span class="property-label">  Cadastros Básicos </span>
<select name="permissoesCadastrosBasicosLst" multiple style="width: 100%; height: 110px">
    <g:each in="${PermissaoEnum.basicos()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>

<div class="grid_4">
<span class="property-label">  Cliente </span>
<select name="permissoesClienteLst" multiple style="width: 100%; height: 110px">
    <g:each in="${PermissaoEnum.clientes()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>
<div class="clear"></div>

<div class="grid_4 omega">
<span class="property-label"> Colaborador </span>
<select name="permissoesConsultorLst" multiple style="width: 100%; height: 110px;">
    <g:each in="${PermissaoEnum.colaboradores()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>

<div class="grid_4 alpha">
<span class="property-label"> Risco </span>
<select name="permissoesRiscoLst" multiple style="width: 100%; height: 110px;">
    <g:each in="${PermissaoEnum.risco()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>

<div class="grid_4 omega">
<span class="property-label"> Relatórios </span>
<select name="permissoesRelatoriosLst" multiple style="width: 100%; height: 110px;">
    <g:each in="${PermissaoEnum.relatorios()}" var="permissao">
      <g:if test="${grupoAcessoInstance.contem(permissao)}">
        <option selected="true"> ${permissao} </option>
      </g:if>
      <g:else>
        <option value="${permissao.toString()}"> ${permissao} </option>
       </g:else>
    </g:each>
</select>
</div>
