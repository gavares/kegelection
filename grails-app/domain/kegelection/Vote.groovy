package kegelection

class Vote {

  static constraints = {
  }

  static belongsTo = Election

  Beer beer
  String userName
  Date voteDate
}
