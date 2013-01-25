package kegelection



import org.junit.*
import grails.test.mixin.*

@TestFor(KegController)
@Mock(Keg)
class KegControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/keg/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.kegInstanceList.size() == 0
        assert model.kegInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.kegInstance != null
    }

    void testSave() {
        controller.save()

        assert model.kegInstance != null
        assert view == '/keg/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/keg/show/1'
        assert controller.flash.message != null
        assert Keg.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/keg/list'

        populateValidParams(params)
        def keg = new Keg(params)

        assert keg.save() != null

        params.id = keg.id

        def model = controller.show()

        assert model.kegInstance == keg
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/keg/list'

        populateValidParams(params)
        def keg = new Keg(params)

        assert keg.save() != null

        params.id = keg.id

        def model = controller.edit()

        assert model.kegInstance == keg
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/keg/list'

        response.reset()

        populateValidParams(params)
        def keg = new Keg(params)

        assert keg.save() != null

        // test invalid parameters in update
        params.id = keg.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/keg/edit"
        assert model.kegInstance != null

        keg.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/keg/show/$keg.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        keg.clearErrors()

        populateValidParams(params)
        params.id = keg.id
        params.version = -1
        controller.update()

        assert view == "/keg/edit"
        assert model.kegInstance != null
        assert model.kegInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/keg/list'

        response.reset()

        populateValidParams(params)
        def keg = new Keg(params)

        assert keg.save() != null
        assert Keg.count() == 1

        params.id = keg.id

        controller.delete()

        assert Keg.count() == 0
        assert Keg.get(keg.id) == null
        assert response.redirectedUrl == '/keg/list'
    }
}
