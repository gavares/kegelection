package kegelection

class Election {

  static constraints = {
  }

  static hasMany = [votes: Vote, beers: Beer]

  Keg keg
  Date startDate
  Date endDate

}
