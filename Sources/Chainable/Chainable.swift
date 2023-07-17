import Foundation

public
protocol Chainable { }

extension Chainable where Self: Any {
    public func then(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }
    
    public func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }

    public func set<V>(_ keyPath: WritableKeyPath<Self, V>, _ value: V) -> Self {
        self.then {
            $0[keyPath: keyPath] = value
        }
    }
}

extension Chainable where Self: AnyObject {
    public func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }

    public func set<V>(_ keyPath: ReferenceWritableKeyPath<Self, V>, _ value: V) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}

extension NSObject: Chainable {}
