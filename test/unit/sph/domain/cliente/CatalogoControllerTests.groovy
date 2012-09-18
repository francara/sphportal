package sph.domain.cliente



import org.junit.*
import grails.test.mixin.*

@TestFor(CatalogoController)
@Mock(Catalogo)
class CatalogoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/catalogo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.catalogoInstanceList.size() == 0
        assert model.catalogoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.catalogoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.catalogoInstance != null
        assert view == '/catalogo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/catalogo/show/1'
        assert controller.flash.message != null
        assert Catalogo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/catalogo/list'


        populateValidParams(params)
        def catalogo = new Catalogo(params)

        assert catalogo.save() != null

        params.id = catalogo.id

        def model = controller.show()

        assert model.catalogoInstance == catalogo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/catalogo/list'


        populateValidParams(params)
        def catalogo = new Catalogo(params)

        assert catalogo.save() != null

        params.id = catalogo.id

        def model = controller.edit()

        assert model.catalogoInstance == catalogo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/catalogo/list'

        response.reset()


        populateValidParams(params)
        def catalogo = new Catalogo(params)

        assert catalogo.save() != null

        // test invalid parameters in update
        params.id = catalogo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/catalogo/edit"
        assert model.catalogoInstance != null

        catalogo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/catalogo/show/$catalogo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        catalogo.clearErrors()

        populateValidParams(params)
        params.id = catalogo.id
        params.version = -1
        controller.update()

        assert view == "/catalogo/edit"
        assert model.catalogoInstance != null
        assert model.catalogoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/catalogo/list'

        response.reset()

        populateValidParams(params)
        def catalogo = new Catalogo(params)

        assert catalogo.save() != null
        assert Catalogo.count() == 1

        params.id = catalogo.id

        controller.delete()

        assert Catalogo.count() == 0
        assert Catalogo.get(catalogo.id) == null
        assert response.redirectedUrl == '/catalogo/list'
    }
}
