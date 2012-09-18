package sph.domain.cliente.grade



import org.junit.*
import grails.test.mixin.*

@TestFor(DiaSemanaIntervaloController)
@Mock(DiaSemanaIntervalo)
class DiaSemanaIntervaloControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/diaSemanaIntervalo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.diaSemanaIntervaloInstanceList.size() == 0
        assert model.diaSemanaIntervaloInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.diaSemanaIntervaloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.diaSemanaIntervaloInstance != null
        assert view == '/diaSemanaIntervalo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/diaSemanaIntervalo/show/1'
        assert controller.flash.message != null
        assert DiaSemanaIntervalo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaIntervalo/list'


        populateValidParams(params)
        def diaSemanaIntervalo = new DiaSemanaIntervalo(params)

        assert diaSemanaIntervalo.save() != null

        params.id = diaSemanaIntervalo.id

        def model = controller.show()

        assert model.diaSemanaIntervaloInstance == diaSemanaIntervalo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaIntervalo/list'


        populateValidParams(params)
        def diaSemanaIntervalo = new DiaSemanaIntervalo(params)

        assert diaSemanaIntervalo.save() != null

        params.id = diaSemanaIntervalo.id

        def model = controller.edit()

        assert model.diaSemanaIntervaloInstance == diaSemanaIntervalo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaIntervalo/list'

        response.reset()


        populateValidParams(params)
        def diaSemanaIntervalo = new DiaSemanaIntervalo(params)

        assert diaSemanaIntervalo.save() != null

        // test invalid parameters in update
        params.id = diaSemanaIntervalo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/diaSemanaIntervalo/edit"
        assert model.diaSemanaIntervaloInstance != null

        diaSemanaIntervalo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/diaSemanaIntervalo/show/$diaSemanaIntervalo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        diaSemanaIntervalo.clearErrors()

        populateValidParams(params)
        params.id = diaSemanaIntervalo.id
        params.version = -1
        controller.update()

        assert view == "/diaSemanaIntervalo/edit"
        assert model.diaSemanaIntervaloInstance != null
        assert model.diaSemanaIntervaloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaIntervalo/list'

        response.reset()

        populateValidParams(params)
        def diaSemanaIntervalo = new DiaSemanaIntervalo(params)

        assert diaSemanaIntervalo.save() != null
        assert DiaSemanaIntervalo.count() == 1

        params.id = diaSemanaIntervalo.id

        controller.delete()

        assert DiaSemanaIntervalo.count() == 0
        assert DiaSemanaIntervalo.get(diaSemanaIntervalo.id) == null
        assert response.redirectedUrl == '/diaSemanaIntervalo/list'
    }
}
