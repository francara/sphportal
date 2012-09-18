package sph.domain.acesso;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.type.StringType;
import org.hibernate.usertype.UserType;

public class UsuarioEnumType implements UserType {

  @Override
  public Object assemble(Serializable cached, Object owner)
      throws HibernateException {
    return cached;
  }

  @Override
  public Object deepCopy(Object value) throws HibernateException {
    return value;
  }

  @Override
  public Serializable disassemble(Object value) throws HibernateException {
    return (Serializable)value;
  }

  @Override
  public boolean equals(Object arg0, Object arg1) throws HibernateException {
    return arg0 == arg1;
  }

  @Override
  public int hashCode(Object obj) throws HibernateException {
    return obj.hashCode();
  }

  @Override
  public boolean isMutable() {
    return false;
  }

  @Override
  public Object nullSafeGet(ResultSet rs, String[] names, Object owner)
      throws HibernateException, SQLException {
    if (names[0] == null)
      return null;

    String valor = rs.getString(names[0]);
    if (valor == null)
      return null;
    return UsuarioEnum.enumByValor(valor);
  }

  @Override
  public void nullSafeSet(PreparedStatement st, Object value, int index)
      throws HibernateException, SQLException {
    if (null == value) {
      st.setNull(index, Types.VARCHAR);
    } else {
      st.setString(index, ((UsuarioEnum) value).getValor());
    }
  }

  @Override
  public Object replace(Object original, Object target, Object owner)
      throws HibernateException {
    return original;
  }

  @Override
  public Class<UsuarioEnum> returnedClass() {
    return UsuarioEnum.class;
  }

  @Override
  public int[] sqlTypes() {
    return new int[] { StringType.INSTANCE.sqlType() };
  }

}
