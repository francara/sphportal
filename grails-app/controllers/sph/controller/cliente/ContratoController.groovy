package sph.controller.cliente

import org.apache.commons.logging.LogFactory
import org.joda.time.LocalDate
import org.springframework.dao.DataIntegrityViolationException

import sph.domain.cliente.CentroDeCusto;
import sph.domain.cliente.ClienteContratoCCusto
import sph.domain.cliente.Contrato;
import sph.domain.cliente.ContratoVigencia;

class ContratoController {
  private static final log = LogFactory.getLog(this)

  static allowedMethods = [save: "POST", update: "POST", delete: ["POST", "GET"]]

  def filtrar() {
    flash.message = "Clientes filtrados por: " + params.filtro
    def filtro = params.filtro
    def contratoListCount = Contrato.withCriteria {
      projections {
        count
      }
      cliente {
        if (filtro.razaoSocial) like 'razaoSocial', "%${filtro.razaoSocial}%"
      }
    }
    def contratoList = Contrato.withCriteria {
      cliente {
        if (filtro.razaoSocial) like 'razaoSocial', "%${filtro.razaoSocial}%"
      }
    }
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    render(view: "list", model: [contratoInstanceList: contratoList, contratoInstanceTotal: contratoListCount])
  }

  def addCCusto() {
    def ccusto = CentroDeCusto.get(params.ccusto)
    def contrato = Contrato.get(params.id)
    def contratoCCusto = new ClienteContratoCCusto()
    contratoCCusto.contrato = contrato
    contratoCCusto.cliente = contrato.cliente
    contratoCCusto.ccusto = ccusto
    contratoCCusto.save(flush:true)
    
    contrato.refresh()
    def centroDeCustoList =  CentroDeCusto.findAll("from CentroDeCusto as cc \
      where                                         \
         not exists(                                \
          from ClienteContratoCCusto as clicc       \
          where                                     \
            clicc.ccusto = cc                       \
            and clicc.contrato = ?                  \
            and clicc.cliente = ?                   \
        )", [contrato, contrato.cliente])
    
    render(template:"addCCusto", model:[contratoInstance: contrato, centroDeCustoList: centroDeCustoList, contratoCCustoInstanceList:contrato.contratoCCustos])
  }

  /**
   * Fecha a ultima vigencia e inclui uma nova. 
   */
  def encerrarVigencia() {
    def contrato = Contrato.get(params.id)
    def contratoVigencia = contrato.getContratoVigente()
    if (contratoVigencia.dataTermino != null) {
      flash.message = "Apenas vigências abertas podem ser encerradas."
      redirect(action: "edit", id:contrato.id)
      return
    }
    contratoVigencia.dataTermino = new LocalDate()

    def novoContratoVigencia = new ContratoVigencia(
      dataInicio: new LocalDate(),
      dataAssinatura: new LocalDate(),
      qtHoras: contratoVigencia.qtHoras,
      valor: contratoVigencia.valor,
      margemFatExtra: contratoVigencia.margemFatExtra,
      horaAberta: contratoVigencia.horaAberta
    )
    contrato.addToVigencias(novoContratoVigencia)
    
    //contratoVigencia.save(flush:true)
    contrato.save()
    render(view: "edit", model: [contratoInstance: contrato])
  }

  def addSla() {
    redirect(controller: "contratoServico", action:"create", params:[returnToController:"contrato"], model:[returnToController:"contrato"])
  }

  def index() {
    redirect(action: "list", params: params)
  }

  def list() {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [contratoInstanceList: Contrato.list(params), contratoInstanceTotal: Contrato.count()]
  }

  def create() {
    [contratoInstance: new Contrato(params)]
  }

  def save() {
    def contratoInstance = new Contrato(params)
    def contratoVigenciaInstance = new ContratoVigencia(params.contratoVigenciaInstance)
    contratoInstance.addToVigencias(contratoVigenciaInstance)

    if (!contratoInstance.save(flush: true)) {
      render(view: "create", model: [contratoInstance: contratoInstance, contratoVigenciaInstance: contratoVigenciaInstance])
      return
    }

    flash.message = message(code: 'default.created.message', args: [
      message(code: 'contrato.label', default: 'Contrato'),
      contratoInstance.id
    ])
    redirect(action: "show", id: contratoInstance.id)
  }

  def show() {
    def contratoInstance = Contrato.get(params.id)
    if (!contratoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    [contratoInstance: contratoInstance]
  }

  def edit() {
    def contratoInstance = Contrato.get(params.id)
    if (!contratoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "list")
      return
    }
    
    /*
     * Seleciona apenas as gradeDia que não estão associas a GradeHoras 
     */
    def centroDeCustoList =  CentroDeCusto.findAll("from CentroDeCusto as cc \
    where                                         \
       not exists(                                \
        from ClienteContratoCCusto as clicc       \
        where                                     \
          clicc.ccusto = cc                       \
          and clicc.contrato = ?                  \
          and clicc.cliente = ?                   \
      )", [contratoInstance, contratoInstance.cliente])    

    [contratoInstance: contratoInstance, centroDeCustoList: centroDeCustoList]
  }

  def update() {
    def contratoInstance = Contrato.get(params.id)
    if (!contratoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    if (params.version) {
      def version = params.version.toLong()
      if (contratoInstance.version > version) {
        contratoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
            [
              message(code: 'contrato.label', default: 'Contrato')]
            as Object[],
            "Another user has updated this Contrato while you were editing")
        render(view: "edit", model: [contratoInstance: contratoInstance])
        return
      }
    }

    contratoInstance.properties = params
    def contratoVigenciaInstance = ContratoVigencia.get(params.contratoVigenciaInstance.id)
    contratoVigenciaInstance.properties = params.contratoVigenciaInstance

    if (!contratoInstance.save(flush: true)) {
      render(view: "edit", model: [contratoInstance: contratoInstance])
      return
    }

    flash.message = message(code: 'default.updated.message', args: [
      message(code: 'contrato.label', default: 'Contrato'),
      contratoInstance.id
    ])
    redirect(action: "show", id: contratoInstance.id)
  }

  def delete() {
    def contratoInstance = Contrato.get(params.id)
    if (!contratoInstance) {
      flash.message = message(code: 'default.not.found.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "list")
      return
    }

    try {
      contratoInstance.delete(flush: true)
      flash.message = message(code: 'default.deleted.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "list")
    }
    catch (DataIntegrityViolationException e) {
      flash.message = message(code: 'default.not.deleted.message', args: [
        message(code: 'contrato.label', default: 'Contrato'),
        params.id
      ])
      redirect(action: "show", id: params.id)
    }
  }
}
