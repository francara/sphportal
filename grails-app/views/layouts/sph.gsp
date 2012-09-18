<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css/960grid', file: 'reset.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/960grid', file: 'text.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/960grid', file: '960.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/960grid', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/960grid', file: 'nav.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'sphere.css')}" type="text/css">
    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'ui.jqgrid.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/ui-redmond', file: 'jquery-ui-1.8.21.custom.css')}" type="text/css">
    
    <g:javascript src="jquery-1.7.1.min.js" />
    <g:javascript src="grid.locale-pt-br.js" />
    <g:javascript src="jquery.jqGrid.min.js" />
    <g:javascript src="jquery.meio.mask.js" />
    
    <g:layoutHead/>
        <r:layoutResources />
    
  </head>
  <body>
    <div class="container_16">
      <div id="titulo" class="grid_16" style="background-color: #aaa">
          <g:render template="/layouts/header" />
      </div>
      
      <div class="clear"></div>    
      <div class="grid_16">
          <g:render template="/layouts/menu" />
      </div>
      
      <div class="clear"></div>
  
      <g:layoutBody/>
      
      <div class="clear"></div>
      <div class="grid_16" id="site_info" style="margin-top: 40px">
        <div class="box">
          <p> By <a href="http://www.spheresystems.com.br">Sphere System</a> - Sistema de help-desk.</p>
        </div>
      </div>
      <div class="clear"></div>
    </div>                  
    </div> <!-- container_16 -->
    
  </body>
</html>