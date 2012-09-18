package sphportal

class NavBarTagLib {
  static namespace = "sph"
  
  def show = { attrs, body ->
    def action = attrs.action
    out << render(template: "/layouts/nav", model:[action: "$action"]) 
  }
}
