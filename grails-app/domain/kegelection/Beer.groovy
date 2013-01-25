package kegelection

class Beer {

  static constraints = {
    name(blank:false, maxSize:128)
    style(blank: false)
    description(maxSize: 512)
  }

  String name
  BeerStyle style
  String description
  String createdBy
  Date createdTimestamp
  String updatedBy
  Date updatedTimestamp

  String toString(){
    return name
  }
}
