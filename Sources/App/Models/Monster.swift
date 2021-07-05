import Vapor
import Bridges

final class Monster: Table, Content, ResponseEncodable {
  static var tableName: String { "mob_db" }
  
  @Column("iName")
  var name: String
  
  @Column("ID")
  var id: Int
  
  @Column("ATK1")
  var atk: Int
  
  @Column("HP")
  var hp: Int
  
  @Column("LV")
  var lv: Int
  
  @Column("Drop1id")
  var drop1id: Int
  
  @Column("Drop1per")
  var drop1per: Int
  
  @Column("Drop2id")
  var drop2id: Int
  
  @Column("Drop2per")
  var drop2per: Int
  
  @Column("Drop3id")
  var drop3id: Int
  
  @Column("Drop3per")
  var drop3per: Int
  
  @Column("Drop4id")
  var drop4id: Int
  
  @Column("Drop4per")
  var drop4per: Int
  
  @Column("Drop5id")
  var drop5id: Int
  
  @Column("Drop5per")
  var drop5per: Int
  
  @Column("Drop6id")
  var drop6id: Int
  
  @Column("Drop6per")
  var drop6per: Int
  
  @Column("Drop7id")
  var drop7id: Int
  
  @Column("Drop7per")
  var drop7per: Int
  
  @Column("Drop8id")
  var drop8id: Int
  
  @Column("Drop8per")
  var drop8per: Int
  
  @Column("Drop9id")
  var drop9id: Int
  
  @Column("Drop9per")
  var drop9per: Int
  
  @Column("DropCardid")
  var dropCardid: Int
  
  @Column("DropCardper")
  var dropCardper: Int
}
