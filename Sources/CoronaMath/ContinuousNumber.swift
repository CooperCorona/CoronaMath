
import Foundation

public protocol ContinuousNumber: DiscreteNumber {

    ///Divides two instances. `rhs` cannot be `Self.zero`.
    static func /(lhs:Self, rhs:Self) -> Self

    ///Computes the square root of `x`. `x` must have a defined square root.
    static func sqrt(_ x:Self) -> Self

    ///Computes the sine of `x`.
    static func sin(_ x:Self) -> Self

    ///Computes the cosine of `x`.
    static func cos(_ x:Self) -> Self

    ///Computes the arctangent of the vector with components `{x, y}`.
    static func atan2(_ y:Self, _ x:Self) -> Self

    // MARK: - Optional

    ///Divides and assigns. `rhs` cannot be `Self.zero`.
    static func /=(lhs:inout Self, rhs:Self)
}


public func /=<T: ContinuousNumber>(lhs:inout T, rhs:T) {
    lhs = lhs / rhs
}


extension Float: ContinuousNumber {
    public static func sqrt(_ x: Float) -> Float {
        return Foundation.sqrt(x)
    }

    public static func sin(_ x: Float) -> Float {
        return Foundation.sin(x)
    }

    public static func cos(_ x: Float) -> Float {
        return Foundation.cos(x)
    }

    public static func atan2(_ y: Float, _ x: Float) -> Float {
        return Foundation.atan2(y, x)
    }
}

extension Double: ContinuousNumber {
    public static func sqrt(_ x: Double) -> Double {
        return Foundation.sqrt(x)
    }

    public static func sin(_ x: Double) -> Double {
        return Foundation.sin(x)
    }

    public static func cos(_ x: Double) -> Double {
        return Foundation.cos(x)
    }

    public static func atan2(_ y: Double, _ x: Double) -> Double {
        return Foundation.atan2(y, x)
    }

}
