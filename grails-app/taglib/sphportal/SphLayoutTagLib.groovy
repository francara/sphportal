package sphportal

class SphLayoutTagLib {
  static namespace = "sphlay"
  
  def nav = { attrs, body ->
    def action = attrs.action
    out << render(template: "/layouts/nav", model:[action: "$action"])
  }
  
  def navbck = { attrs, body ->
    def action = attrs.action
    def backcontroller = attrs.backcontroller
    def backaction = attrs.backaction
    def backid = attrs.backid
    out << render(template: "/layouts/navbck", model:[action: "$action", 
        backcontroller: "$backcontroller", backaction: "$backaction", backid: "$backid"])
  }

}
