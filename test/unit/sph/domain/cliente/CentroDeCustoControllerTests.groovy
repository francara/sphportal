package sph.domain.cliente



import org.junit.*

import sph.controller.cliente.CentroDeCustoController;
import grails.test.mixin.*

@TestFor(CentroDeCustoController)
@Mock(CentroDeCusto)
class CentroDeCustoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/centroDeCusto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.centroDeCustoInstanceList.size() == 0
        assert model.centroDeCustoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.centroDeCustoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.centroDeCustoInstance != null
        assert view == '/centroDeCusto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/centroDeCusto/show/1'
        assert controller.flash.message != null
        assert CentroDeCusto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/centroDeCusto/list'


        populateValidParams(params)
        def centroDeCusto = new CentroDeCusto(params)

        assert centroDeCusto.save() != null

        params.id = centroDeCusto.id

        def model = controller.show()

        assert model.centroDeCustoInstance == centroDeCusto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/centroDeCusto/list'


        populateValidParams(params)
        def centroDeCusto = new CentroDeCusto(params)

        assert centroDeCusto.save() != null

        params.id = centroDeCusto.id

        def model = controller.edit()

        assert model.centroDeCustoInstance == centroDeCusto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/centroDeCusto/list'

        response.reset()


        populateValidParams(params)
        def centroDeCusto = new CentroDeCusto(params)

        assert centroDeCusto.save() != null

        // test invalid parameters in update
        params.id = centroDeCusto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/centroDeCusto/edit"
        assert model.centroDeCustoInstance != null

        centroDeCusto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/centroDeCusto/show/$centroDeCusto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        centroDeCusto.clearErrors()

        populateValidParams(params)
        params.id = centroDeCusto.id
        params.version = -1
        controller.update()

        assert view == "/centroDeCusto/edit"
        assert model.centroDeCustoInstance != null
        assert model.centroDeCustoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/centroDeCusto/list'

        response.reset()

        populateValidParams(params)
        def centroDeCusto = new CentroDeCusto(params)

        assert centroDeCusto.save() != null
        assert CentroDeCusto.count() == 1

        params.id = centroDeCusto.id

        controller.delete()

        assert CentroDeCusto.count() == 0
        assert CentroDeCusto.get(centroDeCusto.id) == null
        assert response.redirectedUrl == '/centroDeCusto/list'
    }
}
