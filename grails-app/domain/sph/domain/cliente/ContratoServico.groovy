package sph.domain.cliente

class ContratoServico {
  String descricao
  Integer qtMinimaLactoMinutos
  
  Prioridade prioridade
  Catalogo catalogo
  PrazoAtendimento prazo
  
  static belongsTo = [contrato : Contrato]
  
  static mapping = {
    // MODEL: ContratoServico [tabela SERVICO] removida
    table "CONTRATO_SERVICO_SLA"
    id column: "ID_CONTRATO_SERVICO_SLA", generator:'sequence', params:[sequence:'SEQ_CONTRATO_SERVICO_SLA']
    // MODEL: ContratoServico [DS_DESCRICAO] incluir
    descricao column: "DS_SERVICO"
    qtMinimaLactoMinutos column: "QT_MINIMA_LANCAMENTO_MINUTOS"
  }
}
