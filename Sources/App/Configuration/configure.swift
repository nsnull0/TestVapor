import Fluent
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config,
                      _ env: inout Environment,
                      _ services: inout Services) throws {
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    /// Register the configured SQLite database to the database config.
    let databases = DatabasesConfig()
    services.register(databases)

    /// Configure migrations
    let migrations = MigrationConfig()
    services.register(migrations)

}