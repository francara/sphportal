package sph.domain.cliente.grade



import org.junit.*
import grails.test.mixin.*

@TestFor(GradeHorasDiaController)
@Mock(GradeHorasDia)
class GradeHorasDiaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gradeHorasDia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradeHorasDiaInstanceList.size() == 0
        assert model.gradeHorasDiaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gradeHorasDiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradeHorasDiaInstance != null
        assert view == '/gradeHorasDia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gradeHorasDia/show/1'
        assert controller.flash.message != null
        assert GradeHorasDia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHorasDia/list'


        populateValidParams(params)
        def gradeHorasDia = new GradeHorasDia(params)

        assert gradeHorasDia.save() != null

        params.id = gradeHorasDia.id

        def model = controller.show()

        assert model.gradeHorasDiaInstance == gradeHorasDia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHorasDia/list'


        populateValidParams(params)
        def gradeHorasDia = new GradeHorasDia(params)

        assert gradeHorasDia.save() != null

        params.id = gradeHorasDia.id

        def model = controller.edit()

        assert model.gradeHorasDiaInstance == gradeHorasDia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeHorasDia/list'

        response.reset()


        populateValidParams(params)
        def gradeHorasDia = new GradeHorasDia(params)

        assert gradeHorasDia.save() != null

        // test invalid parameters in update
        params.id = gradeHorasDia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gradeHorasDia/edit"
        assert model.gradeHorasDiaInstance != null

        gradeHorasDia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gradeHorasDia/show/$gradeHorasDia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gradeHorasDia.clearErrors()

        populateValidParams(params)
        params.id = gradeHorasDia.id
        params.version = -1
        controller.update()

        assert view == "/gradeHorasDia/edit"
        assert model.gradeHorasDiaInstance != null
        assert model.gradeHorasDiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gradeHorasDia/list'

        response.reset()

        populateValidParams(params)
        def gradeHorasDia = new GradeHorasDia(params)

        assert gradeHorasDia.save() != null
        assert GradeHorasDia.count() == 1

        params.id = gradeHorasDia.id

        controller.delete()

        assert GradeHorasDia.count() == 0
        assert GradeHorasDia.get(gradeHorasDia.id) == null
        assert response.redirectedUrl == '/gradeHorasDia/list'
    }
}
