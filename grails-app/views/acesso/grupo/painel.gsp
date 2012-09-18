<%@ page import="sph.domain.acesso.GrupoAcesso"%>
<!doctype html>
<html>
<head>
  <resource:accordion skin="default" />
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'grupoAcesso.label', default: 'GrupoAcesso')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>


  <a href="#list-grupoAcesso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
  <%--
  =====================
  ===  Navigation   ===
  ===================== 
  --%>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
      <li><g:link class="create" action="create"> <g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <%--
  =================
  ===  Grupos   ===
  ================= 
  --%>
  <richui:accordion>
    <g:each in="${grupoAcessoInstanceList}" status="i"
      var="grupoAcessoInstance">
      <richui:accordionItem caption="${grupoAcessoInstance.nome}">
         <select multiple="true">
             <option value="1"> Teste 1 </option>
             <option value="2"> Teste 2 </option>
         </select>
      </richui:accordionItem>
    </g:each>
  </richui:accordion>
</body>
</html>
