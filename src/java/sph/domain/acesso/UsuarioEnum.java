package sph.domain.acesso;

public enum UsuarioEnum {
	CLIENTE("CL"), CONSULTOR("CS"), ADMIN("CS");
	
	private String valor;
	
	private UsuarioEnum(String vl) {
		this.valor = vl;
	}
	
	public String getValor() { return valor; }
	public static UsuarioEnum enumByValor(String valor) {
	  if (valor.equalsIgnoreCase("CL")) return CLIENTE;
	  else return CONSULTOR;
	}
}
