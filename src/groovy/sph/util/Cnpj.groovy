package sph.util

class Cnpj {
  String value
  
  Cnpj() {
    
  }
  
  Cnpj(valor) {
    this.value = valor
  }
  
  Cnpj(String corporativo, String filial, String digito) {
    this.value = fill(corporativo,8) + "/" + fill(filial,4) + "-" + fill(digito,2)
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
    def m = precnpj =~ /(\d*)\/(\d*)-(\d*)/
    return m[0][1]
  }
  
  def filial() {
    def precnpj = value.replaceAll('\\.', '')
    def m = precnpj =~ /(\d*)\/(\d*)-(\d*)/
    return m[0][2]
  }
  
  def digito() {
    def precnpj = value.replaceAll('\\.', '')
    def m = precnpj =~ /(\d*)\/(\d*)-(\d*)/
    return m[0][3]
  }
  
  public String toString() {
    return value
  }
  
  static constraints = {
    value cnpj:true
  }
} 