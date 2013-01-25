package kegelection

import org.springframework.dao.DataIntegrityViolationException

class KegController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [kegInstanceList: Keg.list(params), kegInstanceTotal: Keg.count()]
    }

    def create() {
        [kegInstance: new Keg(params)]
    }

    def save() {
        def kegInstance = new Keg(params)
        if (!kegInstance.save(flush: true)) {
            render(view: "create", model: [kegInstance: kegInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'keg.label', default: 'Keg'), kegInstance.id])
        redirect(action: "show", id: kegInstance.id)
    }

    def show(Long id) {
        def kegInstance = Keg.get(id)
        if (!kegInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "list")
            return
        }

        [kegInstance: kegInstance]
    }

    def edit(Long id) {
        def kegInstance = Keg.get(id)
        if (!kegInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "list")
            return
        }

        [kegInstance: kegInstance]
    }

    def update(Long id, Long version) {
        def kegInstance = Keg.get(id)
        if (!kegInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (kegInstance.version > version) {
                kegInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'keg.label', default: 'Keg')] as Object[],
                          "Another user has updated this Keg while you were editing")
                render(view: "edit", model: [kegInstance: kegInstance])
                return
            }
        }

        kegInstance.properties = params

        if (!kegInstance.save(flush: true)) {
            render(view: "edit", model: [kegInstance: kegInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'keg.label', default: 'Keg'), kegInstance.id])
        redirect(action: "show", id: kegInstance.id)
    }

    def delete(Long id) {
        def kegInstance = Keg.get(id)
        if (!kegInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "list")
            return
        }

        try {
            kegInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'keg.label', default: 'Keg'), id])
            redirect(action: "show", id: id)
        }
    }
}
