package kegelection

class BeerStyle {

  static constraints = {
    name blank: false, unique: true
  }

  String name

  String toString(){
    return name
  }

}
