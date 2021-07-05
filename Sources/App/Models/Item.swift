import Vapor
import Bridges

final class Item: Table, Content {
  static var tableName: String { "item_db" }
  
  @Column("name_japanese")
  var name: String
  
  @Column("id")
  var id: Int
}
