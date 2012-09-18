package sph.domain.cliente



import org.junit.*
import grails.test.mixin.*

@TestFor(PrazoAtendimentoController)
@Mock(PrazoAtendimento)
class PrazoAtendimentoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prazoAtendimento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prazoAtendimentoInstanceList.size() == 0
        assert model.prazoAtendimentoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.prazoAtendimentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prazoAtendimentoInstance != null
        assert view == '/prazoAtendimento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prazoAtendimento/show/1'
        assert controller.flash.message != null
        assert PrazoAtendimento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prazoAtendimento/list'


        populateValidParams(params)
        def prazoAtendimento = new PrazoAtendimento(params)

        assert prazoAtendimento.save() != null

        params.id = prazoAtendimento.id

        def model = controller.show()

        assert model.prazoAtendimentoInstance == prazoAtendimento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prazoAtendimento/list'


        populateValidParams(params)
        def prazoAtendimento = new PrazoAtendimento(params)

        assert prazoAtendimento.save() != null

        params.id = prazoAtendimento.id

        def model = controller.edit()

        assert model.prazoAtendimentoInstance == prazoAtendimento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prazoAtendimento/list'

        response.reset()


        populateValidParams(params)
        def prazoAtendimento = new PrazoAtendimento(params)

        assert prazoAtendimento.save() != null

        // test invalid parameters in update
        params.id = prazoAtendimento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prazoAtendimento/edit"
        assert model.prazoAtendimentoInstance != null

        prazoAtendimento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prazoAtendimento/show/$prazoAtendimento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prazoAtendimento.clearErrors()

        populateValidParams(params)
        params.id = prazoAtendimento.id
        params.version = -1
        controller.update()

        assert view == "/prazoAtendimento/edit"
        assert model.prazoAtendimentoInstance != null
        assert model.prazoAtendimentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prazoAtendimento/list'

        response.reset()

        populateValidParams(params)
        def prazoAtendimento = new PrazoAtendimento(params)

        assert prazoAtendimento.save() != null
        assert PrazoAtendimento.count() == 1

        params.id = prazoAtendimento.id

        controller.delete()

        assert PrazoAtendimento.count() == 0
        assert PrazoAtendimento.get(prazoAtendimento.id) == null
        assert response.redirectedUrl == '/prazoAtendimento/list'
    }
}
