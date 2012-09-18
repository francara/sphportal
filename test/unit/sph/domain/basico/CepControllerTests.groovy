package sph.domain.basico



import org.junit.*
import grails.test.mixin.*

@TestFor(CepController)
@Mock(Cep)
class CepControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cep/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cepInstanceList.size() == 0
        assert model.cepInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.cepInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cepInstance != null
        assert view == '/cep/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cep/show/1'
        assert controller.flash.message != null
        assert Cep.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cep/list'


        populateValidParams(params)
        def cep = new Cep(params)

        assert cep.save() != null

        params.id = cep.id

        def model = controller.show()

        assert model.cepInstance == cep
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cep/list'


        populateValidParams(params)
        def cep = new Cep(params)

        assert cep.save() != null

        params.id = cep.id

        def model = controller.edit()

        assert model.cepInstance == cep
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cep/list'

        response.reset()


        populateValidParams(params)
        def cep = new Cep(params)

        assert cep.save() != null

        // test invalid parameters in update
        params.id = cep.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cep/edit"
        assert model.cepInstance != null

        cep.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cep/show/$cep.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cep.clearErrors()

        populateValidParams(params)
        params.id = cep.id
        params.version = -1
        controller.update()

        assert view == "/cep/edit"
        assert model.cepInstance != null
        assert model.cepInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cep/list'

        response.reset()

        populateValidParams(params)
        def cep = new Cep(params)

        assert cep.save() != null
        assert Cep.count() == 1

        params.id = cep.id

        controller.delete()

        assert Cep.count() == 0
        assert Cep.get(cep.id) == null
        assert response.redirectedUrl == '/cep/list'
    }
}
