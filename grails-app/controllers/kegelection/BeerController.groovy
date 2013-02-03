package kegelection

import org.springframework.dao.DataIntegrityViolationException

class BeerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [beerInstanceList: Beer.list(params), beerInstanceTotal: Beer.count()]
    }

    def create() {
        [beerInstance: new Beer(params)]
    }

    def save() {
        def beerInstance = new Beer(params)

        def l = request.getFile('logo')
        def okcontents = ['image/jpeg', 'image/ppg', 'image/gif']
        if(!okcontents.contains(l.getContentType())){
          flash.message = "Logo must be one of ${okcontents}"
          render(view: "create", model: [beerInstance: beerInstance])
        }

        beerInstance.logoType = l.getContentType()


        if (!beerInstance.save(flush: true)) {
            render(view: "create", model: [beerInstance: beerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'beer.label', default: 'Beer'), beerInstance.id])
        redirect(action: "show", id: beerInstance.id)
    }

    def show(Long id) {
        def beerInstance = Beer.get(id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "list")
            return
        }

        [beerInstance: beerInstance]
    }

    def edit(Long id) {
        def beerInstance = Beer.get(id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "list")
            return
        }

        [beerInstance: beerInstance]
    }

    def update(Long id, Long version) {
        def beerInstance = Beer.get(id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (beerInstance.version > version) {
                beerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'beer.label', default: 'Beer')] as Object[],
                          "Another user has updated this Beer while you were editing")
                render(view: "edit", model: [beerInstance: beerInstance])
                return
            }
        }

        beerInstance.properties = params

        if (!beerInstance.save(flush: true)) {
            render(view: "edit", model: [beerInstance: beerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'beer.label', default: 'Beer'), beerInstance.id])
        redirect(action: "show", id: beerInstance.id)
    }

    def delete(Long id) {
        def beerInstance = Beer.get(id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "list")
            return
        }

        try {
            beerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beer.label', default: 'Beer'), id])
            redirect(action: "show", id: id)
        }
    }

    def logo_image = {
        def beer = Beer.get(params.id)
        if (!beer || !beer.logo) {
            response.sendError(404)
            return;
        }
        response.setContentType(beer.logoType)
        response.setContentLength(beer.logo.size())
        OutputStream out = response.getOutputStream();
        out.write(beer.logo);
        out.close();
    }
}
