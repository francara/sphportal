package sph.domain.basico



import org.junit.*

import sph.controller.basico.UfController;
import grails.test.mixin.*

@TestFor(UfController)
@Mock(Uf)
class UfControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/uf/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ufInstanceList.size() == 0
        assert model.ufInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ufInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ufInstance != null
        assert view == '/uf/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/uf/show/1'
        assert controller.flash.message != null
        assert Uf.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/uf/list'


        populateValidParams(params)
        def uf = new Uf(params)

        assert uf.save() != null

        params.id = uf.id

        def model = controller.show()

        assert model.ufInstance == uf
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/uf/list'


        populateValidParams(params)
        def uf = new Uf(params)

        assert uf.save() != null

        params.id = uf.id

        def model = controller.edit()

        assert model.ufInstance == uf
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/uf/list'

        response.reset()


        populateValidParams(params)
        def uf = new Uf(params)

        assert uf.save() != null

        // test invalid parameters in update
        params.id = uf.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/uf/edit"
        assert model.ufInstance != null

        uf.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/uf/show/$uf.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        uf.clearErrors()

        populateValidParams(params)
        params.id = uf.id
        params.version = -1
        controller.update()

        assert view == "/uf/edit"
        assert model.ufInstance != null
        assert model.ufInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/uf/list'

        response.reset()

        populateValidParams(params)
        def uf = new Uf(params)

        assert uf.save() != null
        assert Uf.count() == 1

        params.id = uf.id

        controller.delete()

        assert Uf.count() == 0
        assert Uf.get(uf.id) == null
        assert response.redirectedUrl == '/uf/list'
    }
}
