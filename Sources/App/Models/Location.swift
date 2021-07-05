import Vapor
import Bridges

final class Location: Table, Content {
  static var tableName: String { "location_db" }

  @Column("ID")
  var id: Int
  
  @Column("name")
  var name: String
  
  @Column("monster_id")
  var monsterId: Int
}
