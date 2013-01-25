package kegelection



import org.junit.*
import grails.test.mixin.*

@TestFor(BeerStyleController)
@Mock(BeerStyle)
class BeerStyleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/beerStyle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.beerStyleInstanceList.size() == 0
        assert model.beerStyleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.beerStyleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.beerStyleInstance != null
        assert view == '/beerStyle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/beerStyle/show/1'
        assert controller.flash.message != null
        assert BeerStyle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/beerStyle/list'

        populateValidParams(params)
        def beerStyle = new BeerStyle(params)

        assert beerStyle.save() != null

        params.id = beerStyle.id

        def model = controller.show()

        assert model.beerStyleInstance == beerStyle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/beerStyle/list'

        populateValidParams(params)
        def beerStyle = new BeerStyle(params)

        assert beerStyle.save() != null

        params.id = beerStyle.id

        def model = controller.edit()

        assert model.beerStyleInstance == beerStyle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/beerStyle/list'

        response.reset()

        populateValidParams(params)
        def beerStyle = new BeerStyle(params)

        assert beerStyle.save() != null

        // test invalid parameters in update
        params.id = beerStyle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/beerStyle/edit"
        assert model.beerStyleInstance != null

        beerStyle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/beerStyle/show/$beerStyle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        beerStyle.clearErrors()

        populateValidParams(params)
        params.id = beerStyle.id
        params.version = -1
        controller.update()

        assert view == "/beerStyle/edit"
        assert model.beerStyleInstance != null
        assert model.beerStyleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/beerStyle/list'

        response.reset()

        populateValidParams(params)
        def beerStyle = new BeerStyle(params)

        assert beerStyle.save() != null
        assert BeerStyle.count() == 1

        params.id = beerStyle.id

        controller.delete()

        assert BeerStyle.count() == 0
        assert BeerStyle.get(beerStyle.id) == null
        assert response.redirectedUrl == '/beerStyle/list'
    }
}
