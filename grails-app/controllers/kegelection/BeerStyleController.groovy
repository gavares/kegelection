package kegelection

import org.springframework.dao.DataIntegrityViolationException

class BeerStyleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [beerStyleInstanceList: BeerStyle.list(params), beerStyleInstanceTotal: BeerStyle.count()]
    }

    def create() {
        [beerStyleInstance: new BeerStyle(params)]
    }

    def save() {
        def beerStyleInstance = new BeerStyle(params)
        if (!beerStyleInstance.save(flush: true)) {
            render(view: "create", model: [beerStyleInstance: beerStyleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), beerStyleInstance.id])
        redirect(action: "show", id: beerStyleInstance.id)
    }

    def show(Long id) {
        def beerStyleInstance = BeerStyle.get(id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "list")
            return
        }

        [beerStyleInstance: beerStyleInstance]
    }

    def edit(Long id) {
        def beerStyleInstance = BeerStyle.get(id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "list")
            return
        }

        [beerStyleInstance: beerStyleInstance]
    }

    def update(Long id, Long version) {
        def beerStyleInstance = BeerStyle.get(id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (beerStyleInstance.version > version) {
                beerStyleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'beerStyle.label', default: 'BeerStyle')] as Object[],
                          "Another user has updated this BeerStyle while you were editing")
                render(view: "edit", model: [beerStyleInstance: beerStyleInstance])
                return
            }
        }

        beerStyleInstance.properties = params

        if (!beerStyleInstance.save(flush: true)) {
            render(view: "edit", model: [beerStyleInstance: beerStyleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), beerStyleInstance.id])
        redirect(action: "show", id: beerStyleInstance.id)
    }

    def delete(Long id) {
        def beerStyleInstance = BeerStyle.get(id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "list")
            return
        }

        try {
            beerStyleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), id])
            redirect(action: "show", id: id)
        }
    }
}
