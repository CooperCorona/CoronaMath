
import Foundation

///Declares the operations needed to be a component of a vector or matrix.
public protocol DiscreteNumber: Equatable {

    ///The additive identity.
    static var zero:Self { get }

    ///The multiplicative identity.
    static var one:Self { get }

    ///Adds two instances.
    static func +(lhs:Self, rhs:Self) -> Self

    ///Negates the instance.
    static prefix func -(x:Self) -> Self

    ///Subtracts two instances.
    static func -(lhs:Self, rhs:Self) -> Self

    ///Multiplies two instances.
    static func *(lhs:Self, rhs:Self) -> Self

    // MARK: - Optional

    ///Adds and assigns.
    static func +=(lhs:inout Self, rhs:Self)

    ///Subtracts and assigns.
    static func -=(lhs:inout Self, rhs:Self)

    ///Multiplies and assigns.
    static func *=(lhs:inout Self, rhs:Self)
}

public func +=<T: DiscreteNumber>(lhs:inout T, rhs:T) {
    lhs = lhs + rhs
}

public func -=<T: DiscreteNumber>(lhs:inout T, rhs:T) {
    lhs = lhs - rhs
}

public func *=<T: DiscreteNumber>(lhs:inout T, rhs:T) {
    lhs = lhs * rhs
}

extension Int: DiscreteNumber {
    public static var zero:Int { return 0 }
    public static var one:Int { return 1 }
}

extension Float: DiscreteNumber {
    public static var zero:Float { return 0.0 }
    public static var one:Float { return 1.0 }
}

extension Double: DiscreteNumber {
    public static var zero:Double { return 0.0 }
    public static var one:Double { return 1.0 }
}
