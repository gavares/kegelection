package kegelection

class Beer {

  static constraints = {
    name(blank:false, maxSize:128)
    style(blank: false)
    description(maxSize: 512)
    logo(nullable: true, maxSize: 1024 * 1024)
  }

  String name
  BeerStyle style
  String description
  String createdBy
  Date createdTimestamp
  String updatedBy
  Date updatedTimestamp
  byte[] logo
  String logoType

  String toString(){
    return name
  }
}
