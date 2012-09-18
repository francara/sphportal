package sph.domain.cliente.grade



import org.junit.*
import grails.test.mixin.*

@TestFor(GradeHorasController)
@Mock(GradeHoras)
class GradeHorasControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gradeHoras/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradeHorasInstanceList.size() == 0
        assert model.gradeHorasInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gradeHorasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradeHorasInstance != null
        assert view == '/gradeHoras/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gradeHoras/show/1'
        assert controller.flash.message != null
        assert GradeHoras.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHoras/list'


        populateValidParams(params)
        def gradeHoras = new GradeHoras(params)

        assert gradeHoras.save() != null

        params.id = gradeHoras.id

        def model = controller.show()

        assert model.gradeHorasInstance == gradeHoras
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHoras/list'


        populateValidParams(params)
        def gradeHoras = new GradeHoras(params)

        assert gradeHoras.save() != null

        params.id = gradeHoras.id

        def model = controller.edit()

        assert model.gradeHorasInstance == gradeHoras
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHoras/list'

        response.reset()


        populateValidParams(params)
        def gradeHoras = new GradeHoras(params)

        assert gradeHoras.save() != null

        // test invalid parameters in update
        params.id = gradeHoras.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gradeHoras/edit"
        assert model.gradeHorasInstance != null

        gradeHoras.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gradeHoras/show/$gradeHoras.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gradeHoras.clearErrors()

        populateValidParams(params)
        params.id = gradeHoras.id
        params.version = -1
        controller.update()

        assert view == "/gradeHoras/edit"
        assert model.gradeHorasInstance != null
        assert model.gradeHorasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gradeHoras/list'

        response.reset()

        populateValidParams(params)
        def gradeHoras = new GradeHoras(params)

        assert gradeHoras.save() != null
        assert GradeHoras.count() == 1

        params.id = gradeHoras.id

        controller.delete()

        assert GradeHoras.count() == 0
        assert GradeHoras.get(gradeHoras.id) == null
        assert response.redirectedUrl == '/gradeHoras/list'
    }
}
