# Chainable

Sintactic sugar for chainable actions over objects

It provides some methods to make creating and working with objects in a functional way.

### Any.then

`func then(_ block: (inout Self) throws -> Void) rethrows -> Self`

For Value types. Allows chained modifications.

```swift

struct Obj {
    var a: String
    var b: Int
}

let o = Obj(a: "hola", b: 0)

let c = o.then {
    $0.a = "adios"
}

```

### AnyObject.then

`func then(_ block: (Self) throws -> Void) rethrows -> Self`

Same as previous but for Reference types. Very useful for in-place initialization.

```swift 
class VC: UIViewController {

    lazy var button = UIButton().then {
        $0.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    @IBAction
    func action() {
        …
    }
}
```

### Any.do

`func `do`(_ block: (Self) throws -> Void) rethrows`

Allows terminations actions with objects

```swift

Obj(a: "hola", b: 0).then { $0.b = 3 }.do(print)

```
