class UrlMappings {

  static mappings = {
    "/acesso/$controller/$action?/$id?"{ }
    
    "/acesso/grupo/$action?/$id?"{ controller = "grupoAcesso" }
    
    "/cliente/$controller/$action?/$id?"{ }
    
//    "/cliente/contrato/$action?/$id?"{ controller = "contratoVigencia" }
    
    "/$controller/$action?/$id?" { 
      constraints { } 
    }


    "/"(view:"/sphindex")
    "/login"{controller="acesso/Login"}
    "/dash"(view:"/sphdashboard")
    "/dashboard"(view:"/sphdashboard")
    "500"(view:'/error')
    
  }
}
