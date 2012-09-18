package sph.domain.acesso



import org.junit.*

import sph.controller.acesso.PermissaoController;
import grails.test.mixin.*

@TestFor(PermissaoController)
@Mock(Permissao)
class PermissaoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/permissao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.permissaoInstanceList.size() == 0
        assert model.permissaoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.permissaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.permissaoInstance != null
        assert view == '/permissao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/permissao/show/1'
        assert controller.flash.message != null
        assert Permissao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/permissao/list'


        populateValidParams(params)
        def permissao = new Permissao(params)

        assert permissao.save() != null

        params.id = permissao.id

        def model = controller.show()

        assert model.permissaoInstance == permissao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/permissao/list'


        populateValidParams(params)
        def permissao = new Permissao(params)

        assert permissao.save() != null

        params.id = permissao.id

        def model = controller.edit()

        assert model.permissaoInstance == permissao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/permissao/list'

        response.reset()


        populateValidParams(params)
        def permissao = new Permissao(params)

        assert permissao.save() != null

        // test invalid parameters in update
        params.id = permissao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/permissao/edit"
        assert model.permissaoInstance != null

        permissao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/permissao/show/$permissao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        permissao.clearErrors()

        populateValidParams(params)
        params.id = permissao.id
        params.version = -1
        controller.update()

        assert view == "/permissao/edit"
        assert model.permissaoInstance != null
        assert model.permissaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/permissao/list'

        response.reset()

        populateValidParams(params)
        def permissao = new Permissao(params)

        assert permissao.save() != null
        assert Permissao.count() == 1

        params.id = permissao.id

        controller.delete()

        assert Permissao.count() == 0
        assert Permissao.get(permissao.id) == null
        assert response.redirectedUrl == '/permissao/list'
    }
}
