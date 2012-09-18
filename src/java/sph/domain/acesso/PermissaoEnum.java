package sph.domain.acesso;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum PermissaoEnum {
  ADMINISTRATIVO_PARAMETROS,
  ADMINISTRATIVO_USUARIO,
  ADMINISTRATIVO_GRUPO,
  CAD_BASICO_FERIADO,
  CAD_BASICO_CEP,
  CAD_BASICO_UF,
  CAD_BASICO_PRIORIDADE,
  CAD_BASICO_PRAZO_AT,
  CAD_BASICO_CIDADE,
  CAD_BASICO_GRADE,
  CAD_BASICO_SERVICOS,
  CLIENTE_CADASTRO_CLIENTE,
  CLIENTE_CADASTRO_CONTATO,
  CLIENTE_CONTRATOS,
  CLIENTE_SLA,
  CLIENTE_CCUSTO,
  CLIENTE_CHAMADO,
  CONSULTOR_CAD_CONSULTOR,
  CONSULTOR_TAREFAS,
  CONSULTOR_ATENDIMENTO,
  RISCO_SERVIDORES,
  RISCO_CHECKLIST,
  RELATORIO_CLIENTES,
  RELATORIO_CONSULTORES,
  RELATORIO_CONTRATOS,
  RELATORIO_MON_CHAMADAS,
  RELATORIO_MON_ATENDIMENTOS;
  
  static PermissaoEnum[] aAdministrativo = new PermissaoEnum[] {
    ADMINISTRATIVO_PARAMETROS,ADMINISTRATIVO_USUARIO,ADMINISTRATIVO_GRUPO  
   };
  static PermissaoEnum[] aBasico = new PermissaoEnum[] {
    CAD_BASICO_FERIADO,CAD_BASICO_CEP,CAD_BASICO_UF,CAD_BASICO_CIDADE,CAD_BASICO_GRADE,CAD_BASICO_SERVICOS,CAD_BASICO_PRIORIDADE, CAD_BASICO_PRAZO_AT
  };  
  static PermissaoEnum[] aCliente = new PermissaoEnum[] {
    CLIENTE_CADASTRO_CLIENTE,CLIENTE_CADASTRO_CONTATO,CLIENTE_CONTRATOS,CLIENTE_SLA,CLIENTE_CCUSTO,CLIENTE_CHAMADO
  };
  static PermissaoEnum[] aColaborador = new PermissaoEnum[] {
    CONSULTOR_CAD_CONSULTOR,CONSULTOR_TAREFAS,CONSULTOR_ATENDIMENTO
  };
  static PermissaoEnum[] aRisco = new PermissaoEnum[] {
    RISCO_SERVIDORES,RISCO_CHECKLIST    
  };  
  static PermissaoEnum[] aRelatorios = new PermissaoEnum[] {
    RELATORIO_CLIENTES,RELATORIO_CONSULTORES,RELATORIO_CONTRATOS,RELATORIO_MON_CHAMADAS,RELATORIO_MON_ATENDIMENTOS   
  };
  
  
  static List<PermissaoEnum> administrativo() {
    return Arrays.asList(aAdministrativo);
  }

  static List<PermissaoEnum> basicos() {
    return Arrays.asList(aBasico);
  }
  
  static List<PermissaoEnum> clientes() {
    return Arrays.asList(aCliente);
  }

  static List<PermissaoEnum> colaboradores() {
    return Arrays.asList(aColaborador);
  }

  static List<PermissaoEnum> risco() {
    return Arrays.asList(aRisco);
  }

  static List<PermissaoEnum> relatorios() {
    return Arrays.asList(aRelatorios);
  }

}
