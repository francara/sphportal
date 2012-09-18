package sph.domain.cliente



import org.junit.*

import sph.controller.cliente.ContratoVigenciaController;
import grails.test.mixin.*

@TestFor(ContratoVigenciaController)
@Mock(ContratoVigencia)
class ContratoVigenciaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contratoVigencia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contratoVigenciaInstanceList.size() == 0
        assert model.contratoVigenciaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contratoVigenciaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contratoVigenciaInstance != null
        assert view == '/contratoVigencia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contratoVigencia/show/1'
        assert controller.flash.message != null
        assert ContratoVigencia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoVigencia/list'


        populateValidParams(params)
        def contratoVigencia = new ContratoVigencia(params)

        assert contratoVigencia.save() != null

        params.id = contratoVigencia.id

        def model = controller.show()

        assert model.contratoVigenciaInstance == contratoVigencia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoVigencia/list'


        populateValidParams(params)
        def contratoVigencia = new ContratoVigencia(params)

        assert contratoVigencia.save() != null

        params.id = contratoVigencia.id

        def model = controller.edit()

        assert model.contratoVigenciaInstance == contratoVigencia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoVigencia/list'

        response.reset()


        populateValidParams(params)
        def contratoVigencia = new ContratoVigencia(params)

        assert contratoVigencia.save() != null

        // test invalid parameters in update
        params.id = contratoVigencia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contratoVigencia/edit"
        assert model.contratoVigenciaInstance != null

        contratoVigencia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contratoVigencia/show/$contratoVigencia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contratoVigencia.clearErrors()

        populateValidParams(params)
        params.id = contratoVigencia.id
        params.version = -1
        controller.update()

        assert view == "/contratoVigencia/edit"
        assert model.contratoVigenciaInstance != null
        assert model.contratoVigenciaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contratoVigencia/list'

        response.reset()

        populateValidParams(params)
        def contratoVigencia = new ContratoVigencia(params)

        assert contratoVigencia.save() != null
        assert ContratoVigencia.count() == 1

        params.id = contratoVigencia.id

        controller.delete()

        assert ContratoVigencia.count() == 0
        assert ContratoVigencia.get(contratoVigencia.id) == null
        assert response.redirectedUrl == '/contratoVigencia/list'
    }
}
