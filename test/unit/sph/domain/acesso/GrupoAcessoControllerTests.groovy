package sph.domain.acesso



import org.junit.*

import sph.controller.acesso.GrupoAcessoController;
import grails.test.mixin.*

@TestFor(GrupoAcessoController)
@Mock(GrupoAcesso)
class GrupoAcessoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/grupoAcesso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.grupoAcessoInstanceList.size() == 0
        assert model.grupoAcessoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.grupoAcessoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.grupoAcessoInstance != null
        assert view == '/grupoAcesso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/grupoAcesso/show/1'
        assert controller.flash.message != null
        assert GrupoAcesso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAcesso/list'


        populateValidParams(params)
        def grupoAcesso = new GrupoAcesso(params)

        assert grupoAcesso.save() != null

        params.id = grupoAcesso.id

        def model = controller.show()

        assert model.grupoAcessoInstance == grupoAcesso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAcesso/list'


        populateValidParams(params)
        def grupoAcesso = new GrupoAcesso(params)

        assert grupoAcesso.save() != null

        params.id = grupoAcesso.id

        def model = controller.edit()

        assert model.grupoAcessoInstance == grupoAcesso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/grupoAcesso/list'

        response.reset()


        populateValidParams(params)
        def grupoAcesso = new GrupoAcesso(params)

        assert grupoAcesso.save() != null

        // test invalid parameters in update
        params.id = grupoAcesso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/grupoAcesso/edit"
        assert model.grupoAcessoInstance != null

        grupoAcesso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/grupoAcesso/show/$grupoAcesso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        grupoAcesso.clearErrors()

        populateValidParams(params)
        params.id = grupoAcesso.id
        params.version = -1
        controller.update()

        assert view == "/grupoAcesso/edit"
        assert model.grupoAcessoInstance != null
        assert model.grupoAcessoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/grupoAcesso/list'

        response.reset()

        populateValidParams(params)
        def grupoAcesso = new GrupoAcesso(params)

        assert grupoAcesso.save() != null
        assert GrupoAcesso.count() == 1

        params.id = grupoAcesso.id

        controller.delete()

        assert GrupoAcesso.count() == 0
        assert GrupoAcesso.get(grupoAcesso.id) == null
        assert response.redirectedUrl == '/grupoAcesso/list'
    }
}
