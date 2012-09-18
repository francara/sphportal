package sph.domain.basico



import org.junit.*

import sph.controller.basico.FeriadoController;
import grails.test.mixin.*

@TestFor(FeriadoController)
@Mock(Feriado)
class FeriadoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/feriado/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.feriadoInstanceList.size() == 0
        assert model.feriadoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.feriadoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.feriadoInstance != null
        assert view == '/feriado/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/feriado/show/1'
        assert controller.flash.message != null
        assert Feriado.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/feriado/list'


        populateValidParams(params)
        def feriado = new Feriado(params)

        assert feriado.save() != null

        params.id = feriado.id

        def model = controller.show()

        assert model.feriadoInstance == feriado
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/feriado/list'


        populateValidParams(params)
        def feriado = new Feriado(params)

        assert feriado.save() != null

        params.id = feriado.id

        def model = controller.edit()

        assert model.feriadoInstance == feriado
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/feriado/list'

        response.reset()


        populateValidParams(params)
        def feriado = new Feriado(params)

        assert feriado.save() != null

        // test invalid parameters in update
        params.id = feriado.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/feriado/edit"
        assert model.feriadoInstance != null

        feriado.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/feriado/show/$feriado.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        feriado.clearErrors()

        populateValidParams(params)
        params.id = feriado.id
        params.version = -1
        controller.update()

        assert view == "/feriado/edit"
        assert model.feriadoInstance != null
        assert model.feriadoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/feriado/list'

        response.reset()

        populateValidParams(params)
        def feriado = new Feriado(params)

        assert feriado.save() != null
        assert Feriado.count() == 1

        params.id = feriado.id

        controller.delete()

        assert Feriado.count() == 0
        assert Feriado.get(feriado.id) == null
        assert response.redirectedUrl == '/feriado/list'
    }
}
