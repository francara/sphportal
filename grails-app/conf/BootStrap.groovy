import java.util.Date;

import org.joda.time.LocalDate
import org.joda.time.LocalTime

import sph.domain.acesso.GrupoAcesso
import sph.domain.acesso.Permissao
import sph.domain.acesso.PermissaoEnum;
import sph.domain.acesso.Usuario
import sph.domain.basico.Cidade
import sph.domain.basico.Uf
import sph.domain.cliente.Catalogo
import sph.domain.cliente.Cliente
import sph.domain.cliente.Contrato
import sph.domain.cliente.ContratoVigencia
import sph.domain.cliente.PrazoAtendimento;
import sph.domain.cliente.Prioridade
import sph.domain.cliente.grade.DiaSemanaIntervalo
import sph.domain.cliente.grade.GradeDia
import sph.domain.cliente.grade.GradeHoras
import sph.domain.cliente.grade.GradeHorasDia
import sph.domain.cliente.grade.IntervaloHora;
import grails.util.GrailsUtil;

class BootStrap {

  def init = { servletContext ->
    switch(GrailsUtil.environment) {
      case "development":
        createBasico()
        createAcesso()
        createCatalogo()
        createClientes()
        createGrade()
      break
      case "test":
        createAcesso()
        createCatalogo()
        createClientes()
      break
      case "production":
        createBasico()
        createAcesso()
        break
    }
    
  }
  
  def destroy = {
  }

  def createBasico = {
    def sp = new Uf(codigo: "SP", descricao: "São Paulo") 
    sp.save()
    new Uf(codigo: "RJ", descricao: "Rio de Janeiro").save()
    new Uf(codigo: "MG", descricao: "Minas Gerais").save()
    new Uf(codigo: "PR", descricao: "Paraná").save()
    new Uf(codigo: "SC", descricao: "Santa Catarina").save()
    new Uf(codigo: "RS", descricao: "Rio Grande do Sul").save()
    def ms = new Uf(codigo: "MS", descricao: "Mato Grosso do Sul").save()
    
    new Cidade(codigo:"SP", descricao: "São Paulo", uf : sp).save()
    new Cidade(codigo:"SBRN", descricao: "São Bernardo", uf : sp).save()
    new Cidade(codigo:"CG", descricao: "Campo Grande", uf : ms).save()
  }
  
  def createCatalogo = {
    new Catalogo(descricao: "Consultoria").save()
    new Prioridade(descricao: "Normal").save()
    new Prioridade(descricao: "Alta").save()
    new Prioridade(descricao: "Extrema").save()
    new PrazoAtendimento(qtMinutosAtendimento:20, prazoIndeterminado:false).save()
    new PrazoAtendimento(qtMinutosAtendimento:40, prazoIndeterminado:false).save()
    new PrazoAtendimento(qtMinutosAtendimento:120, prazoIndeterminado:false).save()
  }
  
  def createClientes = {
    def cliente = new Cliente(
      razaoSocial:"FCARA", nomeFantasia:"FCARA",
      cnpjCorporativo:123,cnpjFilial:456,cnpjDigito:78,
      cep:13030000,logradouro:"Rua Rocha",complemento:"Ap 1108",
      bairro:"Bela Vista",numero:464,
      cidade:Cidade.get(1),uf:Uf.get(1),
      inscricaoEstadual:999,inscricaoMunicipal:888,ativo:true
    ).save(flush:true)
    
    def contrato = new Contrato(descricao:"Default", cliente:cliente, dataInicio:new LocalDate(), ativo:true)
    def vigencia = new ContratoVigencia(
      dataInicio:new LocalDate(),
      dataAssinatura: new LocalDate(),
      qtHoras: 100,
      valor:new BigDecimal(1000000),
      margemFatExtra: 20,
      horaAberta: false
    )
    contrato.addToVigencias(vigencia)
    contrato.save()
  }
  
  def createGrade = {    
    IntervaloHora intervalo1 = new IntervaloHora(
      horaInicio: new LocalTime(8,0),
      horaFim: new LocalTime(12,0),
      percentualExtra: 0
    )
    IntervaloHora intervalo2 = new IntervaloHora(
      horaInicio: new LocalTime(14,0),
      horaFim: new LocalTime(18,0),
      percentualExtra: 0
    )
    intervalo1.save(flush:true)
    intervalo2.save(flush:true)
    
    GradeDia dia = new GradeDia(
      descricao: "Seg",
      diaUtil: true
    )
    dia.addToIntervalos(new DiaSemanaIntervalo(intervalo1))
    dia.addToIntervalos(new DiaSemanaIntervalo(intervalo2))
    dia.save(flush:true)
    
    GradeHoras grade = new GradeHoras(
      descricao: "DEFAULT"
    )
    grade.addToDias(new GradeHorasDia(dia))
    grade.save(flush:true)
  }
  
  def createAcesso = {
    def administradorGrp = new GrupoAcesso(nome: "Administrador")
    allPermissoes().each(){administradorGrp.addToPermissoes(it)}
    administradorGrp.save()
      
    def clienteGrp = new GrupoAcesso(nome: "Cliente")
    clienteGrp.addToPermissoes(new Permissao(codigo: PermissaoEnum.ADMINISTRATIVO_GRUPO.toString(), dataInclusao: new Date()))
    clienteGrp.save()
    
    new GrupoAcesso(nome: "Consultor").save()
    new Usuario(nome:"root", password:"1234", admin:true, grupo:administradorGrp).save(flush:true)
  }
    
  def allPermissoes  = {
    Set<Permissao> permissoes = new HashSet<Permissao>()
    PermissaoEnum.values().each { el -> 
      permissoes.add(new Permissao(codigo: el.toString(), dataInclusao: new Date()))
    }
    return permissoes
  }
}
