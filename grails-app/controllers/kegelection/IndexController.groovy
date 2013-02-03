package kegelection

class IndexController {

  def index() {
    [kegInstanceList: Keg.findAll()]
  }

}
