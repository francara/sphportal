<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

<link rel="stylesheet" href="${resource(dir: 'css', file: 'sphere.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'superfish.css')}" type="text/css">

<link rel="stylesheet" href="${resource(dir: 'css', file: '960.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'text.css')}" type="text/css">

<g:javascript src="hoverIntent.js" />
<g:javascript src="superfish.js" />

<g:javascript>
    $(document).ready(function(){ 
        $("ul.sf-menu").superfish(); 
    });
  </g:javascript>

<g:layoutHead />
<r:layoutResources />
</head>
<body> 
    <div id="pagina" class="container_16">
        <div class="grid_16"></div>
        <div class="clear"></div>
        
        <g:render template="/layouts/header" />
        <g:render template="/layouts/menu" />
      
        <div id="conteudo" class="grid_16"  >
            <g:layoutBody />
        </div>
        <div class="clear"></div>
        
      <div class="footer grid_16"></div>
    </div>
    
    <div id="spinner" class="spinner grid_12" style="display: none;">
        <g:message code="spinner.alt" default="Loading&hellip;" />
    </div>


    <g:javascript library="application" />
    <r:layoutResources />
</body>
</html>