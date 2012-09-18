package sph.domain.cliente.grade



import org.junit.*
import grails.test.mixin.*

@TestFor(IntervaloHoraController)
@Mock(IntervaloHora)
class IntervaloHoraControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/intervaloHora/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.intervaloHoraInstanceList.size() == 0
        assert model.intervaloHoraInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.intervaloHoraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.intervaloHoraInstance != null
        assert view == '/intervaloHora/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/intervaloHora/show/1'
        assert controller.flash.message != null
        assert IntervaloHora.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/intervaloHora/list'


        populateValidParams(params)
        def intervaloHora = new IntervaloHora(params)

        assert intervaloHora.save() != null

        params.id = intervaloHora.id

        def model = controller.show()

        assert model.intervaloHoraInstance == intervaloHora
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/intervaloHora/list'


        populateValidParams(params)
        def intervaloHora = new IntervaloHora(params)

        assert intervaloHora.save() != null

        params.id = intervaloHora.id

        def model = controller.edit()

        assert model.intervaloHoraInstance == intervaloHora
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/intervaloHora/list'

        response.reset()


        populateValidParams(params)
        def intervaloHora = new IntervaloHora(params)

        assert intervaloHora.save() != null

        // test invalid parameters in update
        params.id = intervaloHora.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/intervaloHora/edit"
        assert model.intervaloHoraInstance != null

        intervaloHora.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/intervaloHora/show/$intervaloHora.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        intervaloHora.clearErrors()

        populateValidParams(params)
        params.id = intervaloHora.id
        params.version = -1
        controller.update()

        assert view == "/intervaloHora/edit"
        assert model.intervaloHoraInstance != null
        assert model.intervaloHoraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/intervaloHora/list'

        response.reset()

        populateValidParams(params)
        def intervaloHora = new IntervaloHora(params)

        assert intervaloHora.save() != null
        assert IntervaloHora.count() == 1

        params.id = intervaloHora.id

        controller.delete()

        assert IntervaloHora.count() == 0
        assert IntervaloHora.get(intervaloHora.id) == null
        assert response.redirectedUrl == '/intervaloHora/list'
    }
}
