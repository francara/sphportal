package sph.util

class Cpf {
  String value
  
  Cpf() {
    
  }
  
  Cpf(valor) {
    def vl = valor.replaceAll('\\.', '')
    vl = vl.replaceAll('-', '')
    vl = fill(vl, 11)
    this.value = vl.substring(0, vl.size()-2) + '-' + vl.substring(vl.size()-2, vl.size())
  }
  
  Cpf(String corpo, String digito) {
    this.value = fill(corpo,9) + "-" + fill(digito,2)
  }
  
  private String fill(String parte, Integer q) {
    def max = q - parte.size()
    if (max == 0) return parte
    
    def trailing = ""
    (0 .. max-1).each {trailing += "0"}
    return trailing + parte
  }
  
  def principal() {
    def precnpj = value.replaceAll('\\.', '')
    def m = precnpj =~ /(\d*)-(\d*)/
    return m[0][1]
  }
  
  def digito() {
    def precnpj = value.replaceAll('\\.', '')
    def m = precnpj =~ /(\d*)-(\d*)/
    return m[0][2]
  }
  
  public Long toInteger() {
    def p1 = 100 * new Long(principal())
    def p2 =  new Integer(digito())
    return p1 + p2
  }
  
  public String toString() {
    return value
  }
  
  static constraints = {
    value cpf:true
  }
} 