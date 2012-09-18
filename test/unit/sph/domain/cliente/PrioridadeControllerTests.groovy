package sph.domain.cliente



import org.junit.*

import sph.controller.basico.PrioridadeController;
import grails.test.mixin.*

@TestFor(PrioridadeController)
@Mock(Prioridade)
class PrioridadeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prioridade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prioridadeInstanceList.size() == 0
        assert model.prioridadeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.prioridadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prioridadeInstance != null
        assert view == '/prioridade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prioridade/show/1'
        assert controller.flash.message != null
        assert Prioridade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prioridade/list'


        populateValidParams(params)
        def prioridade = new Prioridade(params)

        assert prioridade.save() != null

        params.id = prioridade.id

        def model = controller.show()

        assert model.prioridadeInstance == prioridade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prioridade/list'


        populateValidParams(params)
        def prioridade = new Prioridade(params)

        assert prioridade.save() != null

        params.id = prioridade.id

        def model = controller.edit()

        assert model.prioridadeInstance == prioridade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prioridade/list'

        response.reset()


        populateValidParams(params)
        def prioridade = new Prioridade(params)

        assert prioridade.save() != null

        // test invalid parameters in update
        params.id = prioridade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prioridade/edit"
        assert model.prioridadeInstance != null

        prioridade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prioridade/show/$prioridade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prioridade.clearErrors()

        populateValidParams(params)
        params.id = prioridade.id
        params.version = -1
        controller.update()

        assert view == "/prioridade/edit"
        assert model.prioridadeInstance != null
        assert model.prioridadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prioridade/list'

        response.reset()

        populateValidParams(params)
        def prioridade = new Prioridade(params)

        assert prioridade.save() != null
        assert Prioridade.count() == 1

        params.id = prioridade.id

        controller.delete()

        assert Prioridade.count() == 0
        assert Prioridade.get(prioridade.id) == null
        assert response.redirectedUrl == '/prioridade/list'
    }
}
