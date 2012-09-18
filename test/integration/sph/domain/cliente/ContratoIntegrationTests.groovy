package sph.domain.cliente

import static org.junit.Assert.*
import org.junit.*

class ContratoIntegrationTests {

  @Before
  void setUp() {
  }

  @After
  void tearDown() {
  }

  @Test
  void testSomething() {
    def vigencias = ContratoVigencia.list()
    assertEquals(1, vigencias.size())
   
    Contrato contrato = Contrato.findByDescricao("Default")
    ContratoVigencia contratoVigencia = contrato.getContratoVigente()
    assertEquals(vigencias.get(0), contratoVigencia)
  }
}
