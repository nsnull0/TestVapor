import Vapor
import Routing

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get { (request) in
        return "Hello Yoseph"
    }
    
    router.post(User.self, at: "users") { (request, user) -> EventLoopFuture<User> in
        
        return user.save(on: request)
    }
}
