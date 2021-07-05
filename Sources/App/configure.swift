import MySQLBridge
import VaporBridges
import Vapor

// configures your application
public func configure(_ app: Application) throws {
  
  // Логирование
  app.logger.logLevel = .notice
  app.bridges.logger.logLevel = .info
  
  app.mysql.register(.ragnarokDB)
  
  try routes(app)
}


extension DatabaseIdentifier {
  public static var ragnarokDB: DatabaseIdentifier {
    .init(name: "ragnarok", host: .dockerMysql, maxConnectionsPerEventLoop: 1)
  }
}

extension DatabaseHost {
  public static var dockerMysql: DatabaseHost {
    .init(hostname: "some_ip", port: 3307, username: "ragnarokuser", password: "123456", tlsConfiguration: .forClient(certificateVerification: .none))
  }
}
