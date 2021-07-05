import SwifQL
import Vapor

func routes(_ app: Application) throws {
  app.get { req in
    return "It works!"
  }
  
  
  // MARK: - All Monsters
  app.get("monsters") { req -> EventLoopFuture<[Monster]> in
    req.mysql.connection(to: .ragnarokDB) { conn in
      SwifQL.select(Monster.table.*).from(Monster.table).execute(on: conn).all(decoding: Monster.self)
    }
  }
  
  app.get("items", ":id") { req -> EventLoopFuture<[Item]> in
    let ids: [Int] = req.parameters.get("id", as: String.self)!.split(separator: ",").map { Int($0)! }
    
    let query = SwifQL
      .select(Item.table.*)
      .from(Item.table)
      .where(\Item.$id)
      .in(ids)
    
    print(query.prepare(.mysql).plain)
    
    let execute = req.mysql.connection(to: .ragnarokDB) { conn in
      query.execute(on: conn)
        .all(decoding: Item.self)
    }
    
    return execute
  }
  
  // MARK: - Monster by ID
  app.get("monsters", ":ID") { req -> EventLoopFuture<[Monster]> in
    
    let ids: [Int] = req.parameters.get("ID", as: String.self)!.split(separator: ",").map { Int($0)! }
    
    let query = SwifQL
      .select(Monster.table.*)
      .from(Monster.table)
      .where(\Monster.$id)
      .in(ids)
    
    print(query.prepare(.mysql).plain)
    
    let execute = req.mysql.connection(to: .ragnarokDB) { conn in
      query.execute(on: conn)
        .all(decoding: Monster.self)
    }
    
    return execute
  }
  
  // MARK: - Monsters on Location
  
  app.get("location", ":name") { req -> EventLoopFuture<[Location]> in
    let name: String = req.parameters.get("name", as: String.self)!.split(separator: "=").map {
      String($0) }.last!
    
    let query = SwifQL
      .select(Location.table.*)
      .from(Location.table)
      .where(\Location.$name == name)
    
    print(query.prepare(.mysql).plain)
    
    let execute = req.mysql.connection(to: .ragnarokDB) { conn in
      query.execute(on: conn)
        .all(decoding: Location.self)
    }
    
    return execute
  }
}

