package sph.domain.cliente



import org.junit.*

import sph.controller.cliente.ContratoServicoController;
import grails.test.mixin.*

@TestFor(ContratoServicoController)
@Mock(ContratoServico)
class ContratoServicoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contratoServico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contratoServicoInstanceList.size() == 0
        assert model.contratoServicoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contratoServicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contratoServicoInstance != null
        assert view == '/contratoServico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contratoServico/show/1'
        assert controller.flash.message != null
        assert ContratoServico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoServico/list'


        populateValidParams(params)
        def contratoServico = new ContratoServico(params)

        assert contratoServico.save() != null

        params.id = contratoServico.id

        def model = controller.show()

        assert model.contratoServicoInstance == contratoServico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoServico/list'


        populateValidParams(params)
        def contratoServico = new ContratoServico(params)

        assert contratoServico.save() != null

        params.id = contratoServico.id

        def model = controller.edit()

        assert model.contratoServicoInstance == contratoServico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contratoServico/list'

        response.reset()


        populateValidParams(params)
        def contratoServico = new ContratoServico(params)

        assert contratoServico.save() != null

        // test invalid parameters in update
        params.id = contratoServico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contratoServico/edit"
        assert model.contratoServicoInstance != null

        contratoServico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contratoServico/show/$contratoServico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contratoServico.clearErrors()

        populateValidParams(params)
        params.id = contratoServico.id
        params.version = -1
        controller.update()

        assert view == "/contratoServico/edit"
        assert model.contratoServicoInstance != null
        assert model.contratoServicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contratoServico/list'

        response.reset()

        populateValidParams(params)
        def contratoServico = new ContratoServico(params)

        assert contratoServico.save() != null
        assert ContratoServico.count() == 1

        params.id = contratoServico.id

        controller.delete()

        assert ContratoServico.count() == 0
        assert ContratoServico.get(contratoServico.id) == null
        assert response.redirectedUrl == '/contratoServico/list'
    }
}
