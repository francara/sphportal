package sph.domain.cliente

import sph.domain.basico.Cidade
import sph.domain.basico.Uf
import sph.util.Cnpj;

class Cliente {
  String razaoSocial
  String nomeFantasia
  Integer cnpjCorporativo
  Integer cnpjFilial
  Integer cnpjDigito
  Integer cep
  String logradouro
  String complemento
  String bairro
  Integer numero
  Cidade cidade
  Uf uf
  String inscricaoEstadual
  String inscricaoMunicipal
  boolean ativo
  
  
  def cnpj() {
    if (cnpjCorporativo == null || cnpjFilial == null || cnpjDigito == null) return new Cnpj()
    else return new Cnpj(cnpjCorporativo.toString(), cnpjFilial.toString(), cnpjDigito.toString())
  }
  
  String getCnpj() {
    return cnpj().toString()
  }
  
  def _cnpj(String cnpjStr) {
    if (cnpjStr == null || cnpjStr == '') {
      this.errors.rejectValue("cnpj", "Cnpj invalido");
      return
    }
    Cnpj cnpj = new Cnpj(cnpjStr)
    this.cnpjCorporativo = new Integer(cnpj.principal())
    this.cnpjFilial = new Integer(cnpj.filial())
    this.cnpjDigito = new Integer(cnpj.digito())
  }
  
  def _cep(String cepStr) {
    if (cepStr == null || cepStr == '') return
    this.cep = new Integer(cepStr.replaceAll('-', ''))
  }
  
  static hasMany = [contatos:Contato]
  
  // VIEW: Cliente - Validador de CPF/CNPJ
  static constraints = {
    razaoSocial maxSize:20, blank:false, nullable:false, unique:true
    nomeFantasia maxSize:20, blank:false, nullable:false, unique:true
    cnpjFilial blank:true, nullable:true
    logradouro maxSize:20,blank:true, nullable:true
    bairro maxSize:20,blank:true, nullable:true
    complemento maxSize:20,blank:true, nullable:true
    numero blank:true, nullable:true
    cep blank:true, nullable:true
    inscricaoEstadual maxSize:20, blank:true, nullable:true, unique:true
    inscricaoMunicipal maxSize:20, blank:true, nullable:true, unique:true
    ativo blank:false, nullable:false
  }
  
  static mapping = {
    id column: "ID_CLIENTE", generator:'sequence', params:[sequence:'SEQ_CLIENTE']
    razaoSocial column: 'DS_RAZAO_SOCIAL'
    nomeFantasia column: 'DS_NOME_FANTASIA'
    cnpjCorporativo column: 'CD_CNPJ_CORP'
    cnpjFilial column: 'CD_CNPJ_FILIAL'
    cnpjDigito column: 'CD_CNPJ_DIGITO'
    // MODEL: Cliente [ID_CEP] [COD_CEP]
    cep column: 'COD_CEP'
    logradouro column: 'DS_ENDERECO'
    complemento column: 'DS_ENDERECO_COMPLEMENTO'
    // MODEL: Cliente criar [DS_BAIRRO]
    // MODEL: Cliente remover [DS_CIDADE] criar [ID_CIDADE]
    bairro column: 'DS_BAIRRO'
    numero column: 'NR_ENDERECO'
    inscricaoEstadual column: 'DS_INSCR_ESTADUAL'
    inscricaoMunicipal column: 'DS_INSCR_MUNICIPAL'
    ativo column: 'FL_ATIVO'
  }
}
