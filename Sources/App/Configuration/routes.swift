import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get { (request) in
        return "Hello Yoseph"
    }
}
