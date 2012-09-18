package sph.domain.cliente



import org.junit.*

import sph.controller.cliente.ContratoController;
import grails.test.mixin.*

@TestFor(ContratoController)
@Mock(Contrato)
class ContratoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contrato/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contratoInstanceList.size() == 0
        assert model.contratoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contratoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contratoInstance != null
        assert view == '/contrato/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contrato/show/1'
        assert controller.flash.message != null
        assert Contrato.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contrato/list'


        populateValidParams(params)
        def contrato = new Contrato(params)

        assert contrato.save() != null

        params.id = contrato.id

        def model = controller.show()

        assert model.contratoInstance == contrato
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contrato/list'


        populateValidParams(params)
        def contrato = new Contrato(params)

        assert contrato.save() != null

        params.id = contrato.id

        def model = controller.edit()

        assert model.contratoInstance == contrato
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contrato/list'

        response.reset()


        populateValidParams(params)
        def contrato = new Contrato(params)

        assert contrato.save() != null

        // test invalid parameters in update
        params.id = contrato.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contrato/edit"
        assert model.contratoInstance != null

        contrato.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contrato/show/$contrato.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contrato.clearErrors()

        populateValidParams(params)
        params.id = contrato.id
        params.version = -1
        controller.update()

        assert view == "/contrato/edit"
        assert model.contratoInstance != null
        assert model.contratoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contrato/list'

        response.reset()

        populateValidParams(params)
        def contrato = new Contrato(params)

        assert contrato.save() != null
        assert Contrato.count() == 1

        params.id = contrato.id

        controller.delete()

        assert Contrato.count() == 0
        assert Contrato.get(contrato.id) == null
        assert response.redirectedUrl == '/contrato/list'
    }
}
