package sph.domain.cliente.grade



import org.junit.*
import grails.test.mixin.*

@TestFor(GradeDiaController)
@Mock(GradeDia)
class GradeDiaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gradeDia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradeDiaInstanceList.size() == 0
        assert model.gradeDiaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gradeDiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradeDiaInstance != null
        assert view == '/gradeDia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gradeDia/show/1'
        assert controller.flash.message != null
        assert GradeDia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeDia/list'


        populateValidParams(params)
        def gradeDia = new GradeDia(params)

        assert gradeDia.save() != null

        params.id = gradeDia.id

        def model = controller.show()

        assert model.gradeDiaInstance == gradeDia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeDia/list'


        populateValidParams(params)
        def gradeDia = new GradeDia(params)

        assert gradeDia.save() != null

        params.id = gradeDia.id

        def model = controller.edit()

        assert model.gradeDiaInstance == gradeDia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gradeDia/list'

        response.reset()


        populateValidParams(params)
        def gradeDia = new GradeDia(params)

        assert gradeDia.save() != null

        // test invalid parameters in update
        params.id = gradeDia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gradeDia/edit"
        assert model.gradeDiaInstance != null

        gradeDia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gradeDia/show/$gradeDia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gradeDia.clearErrors()

        populateValidParams(params)
        params.id = gradeDia.id
        params.version = -1
        controller.update()

        assert view == "/gradeDia/edit"
        assert model.gradeDiaInstance != null
        assert model.gradeDiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gradeDia/list'

        response.reset()

        populateValidParams(params)
        def gradeDia = new GradeDia(params)

        assert gradeDia.save() != null
        assert GradeDia.count() == 1

        params.id = gradeDia.id

        controller.delete()

        assert GradeDia.count() == 0
        assert GradeDia.get(gradeDia.id) == null
        assert response.redirectedUrl == '/gradeDia/list'
    }
}
