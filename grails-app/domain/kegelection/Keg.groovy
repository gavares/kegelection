package kegelection

class Keg {

  static constraints = {
    name(blank:false, maxSize: 128)
    currentBeer(blank: false)
    description()

  }

  String name
  String description
  Beer currentBeer
  Date fillDate

}
