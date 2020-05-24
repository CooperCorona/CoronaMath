//
//  ConstantSizeVector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A Vector whose number of components is determined at compile time.
public protocol ConstantSizeVector: VectorBase {

    // MARK: - Required Implementations

    ///The number of components in a vector. Must be greater than 0.
    ///The instance property numberOfComponents must return this value.
    ///Before Swift 4.2, using the same name for a static property and an
    ///instance property returned a compile error.
    #if swift(>=4.2)
    static var numberOfComponents:Int { get }
    static var dimensions:IntSize { get }
    #else
    static var staticNumberOfComponents:Int { get }
    static var staticDimensions:IntSize { get }
    #endif

    // MARK: - Optional Implementations

    ///Initializes all components of the vector with the same value.
    /// - parameter value: The value to repeat for all components of the vector.
    init(repeating value:ComponentType)

    ///Computes the dot product of this vector with *vector*.
    /// - parameter vector: The vector with which to calculate the dot product.
    /// - returns: The dot product of this instance and *vector*.
    func dot(vector:Self) -> ComponentType

    ///Adds two vectors.
    /// - parameter lhs: The vector to add on the left.
    /// - parameter rhs: The vector to add on the right.
    /// - returns: The sum of `lhs` and `rhs`.
    static func +(lhs:Self, rhs:Self) -> Self
    ///Subtracts two vectors.
    /// - parameter lhs: The vector to subtract from.
    /// - parameter rhs: The vector to subtrat by.
    /// - returns: The difference of `lhs` and `rhs`.
    static func -(lhs:Self, rhs:Self) -> Self
    ///Multiplies two vectors component-wise.
    /// - parameter lhs: The vector to multiply by on the left.
    /// - parameter rhs: The vector to multiply by on the right.
    /// - returns: The product of `lhs` and `rhs`.
    static func *(lhs:Self, rhs:Self) -> Self
    ///Assigns and adds two vectors.
    /// - parameter lhs: The vector to add and assign to on the left.
    /// - parameter rhs: The vector to add on the right.
    static func +=(lhs:inout Self, rhs:Self)
    ///Assigns and subtracts two vectors.
    /// - parameter lhs: The vector to subtract from and assign to.
    /// - parameter rhs: The vector to subtract by.
    static func -=(lhs:inout Self, rhs:Self)
    ///Assigns and multiplies two vectors component-wise.
    /// - parameter lhs: The vector to multiply by and assign to on the left.
    /// - parameter rhs: The vector to multiply by on the right.
    static func *=(lhs:inout Self, rhs:Self)
    ///Adds a vector and a scalar.
    /// - parameter lhs: The vector to add by on the left.
    /// - parameter rhs: The scalar to add by on the right.
    /// - returns: The sum of `lhs` and `rhs`.
    static func +(lhs:Self, rhs:ComponentType) -> Self
    ///Adds a scalar and a vector.
    /// - parameter lhs: The scalar to add by on the left.
    /// - parameter rhs: The vector to add by on the right.
    /// - returns: The sum of `lhs` and `rhs`.
    static func +(lhs:ComponentType, rhs:Self) -> Self
    ///Subtracts a vector and a scalar.
    /// - parameter lhs: The vector to subtract from.
    /// - parameter rhs: The scalar to subtract by.
    /// - returns: The difference of `lhs` and `rhs`.
    static func -(lhs:Self, rhs:ComponentType) -> Self
    ///Subtracts a scalar and a vector.
    /// - parameter lhs: The scalar to subtract from.
    /// - parameter rhs: The vector to subtract by.
    /// - returns: The difference of `lhs` and `rhs`.
    static func -(lhs:ComponentType, rhs:Self) -> Self
    ///Multiplies a vector and a scalar.
    /// - parameter lhs: The vector to multiply by on the left.
    /// - parameter rhs: The scalar to multiply by on the right.
    /// - returns: The product of `lhs` and `rhs`.
    static func *(lhs:Self, rhs:ComponentType) -> Self
    ///Mutiplies a scalar and a vector.
    /// - parameter lhs: The scalar to multiply by on the left.
    /// - parameter rhs: The vector to multiply by on the right.
    /// - returns: The product of `lhs` and `rhs`.
    static func *(lhs:ComponentType, rhs:Self) -> Self
    ///Assigns and adds a vector and a scalar.
    /// - parameter lhs: The vector to add and assign to on the left.
    /// - parameter rhs: The scalar to add to on the right.
    static func +=(lhs:inout Self, rhs:ComponentType)
    ///Assigns and subtracts a vector and a scalar.
    /// - parameter lhs: The vector to subtract from and assign to.
    /// - parameter rhs: The scalar to subtract by.
    static func -=(lhs:inout Self, rhs:ComponentType)
    ///Assigns and multiplies a vector and a scalar.
    /// - parameter lhs: The vector to multiply by and assign to on the left.
    /// - parameter rhs: The vector to multiply by on the right.
    static func *=(lhs:inout Self, rhs:ComponentType)
}

// MARK: - Default Implementations

extension ConstantSizeVector {

    #if swift(>=4.2)
    public static var zero:Self { return Self(components: [ComponentType](repeating: Self.ComponentType.zero, count: Self.numberOfComponents)) }

    public var numberOfComponents:Int { return Self.numberOfComponents }

    public static var dimensions:IntSize { return IntSize(rows: Self.numberOfComponents, columns: 1) }

    public var dimensions:IntSize { return Self.dimensions }

    public init(components:[ComponentType]) {
        self.init()
        for i in 0..<min(Self.numberOfComponents, components.count) {
            self[i] = components[i]
        }
    }

    public init(repeating value:ComponentType) {
        self.init(components: [ComponentType](repeating: value, count: Self.numberOfComponents))
    }
    #else
    public static var zero:Self { return Self(components: [ComponentType](repeating: Self.ComponentType.zero, count: Self.staticNumberOfComponents)) }

    public var numberOfComponents:Int { return Self.staticNumberOfComponents }

    public static var staticDimensions:IntSize { return IntSize(rows: Self.staticNumberOfComponents, columns: 1) }

    public var dimensions:IntPoint { return Self.staticDimensions }

    public init(components:[ComponentType]) {
        self.init()
        for i in 0..<min(Self.staticNumberOfComponents, components.count) {
            self[i] = components[i]
        }
    }

    public init(repeating value:ComponentType) {
        self.init(components: [ComponentType](repeating: value, count: Self.staticNumberOfComponents))
    }
    #endif


    public func dot(vector:Self) -> Self.ComponentType {
        return zip(self.components, vector.components).map() { $0 * $1 } .sum()
    }

}

// MARK: - Operator Overloads

public func +<V: ConstantSizeVector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 + $1 })
}

public func -<V: ConstantSizeVector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 - $1 })
}

public func *<V: ConstantSizeVector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 * $1 })
}

public func +=<V: ConstantSizeVector>(lhs:inout V, rhs:V) {
    lhs = lhs + rhs
}

public func -=<V: ConstantSizeVector>(lhs:inout V, rhs:V) {
    lhs = lhs - rhs
}

public func *=<V: ConstantSizeVector>(lhs:inout V, rhs:V) {
    lhs = lhs * rhs
}

public func +<V: ConstantSizeVector>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 + rhs })
}

public func +<V: ConstantSizeVector>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs + $0 })
}

public func -<V: ConstantSizeVector>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 - rhs })
}

public func -<V: ConstantSizeVector>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs - $0 })
}

public func *<V: ConstantSizeVector>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 * rhs })
}

public func *<V: ConstantSizeVector>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs * $0 })
}

public func +=<V: ConstantSizeVector>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs + rhs
}

public func -=<V: ConstantSizeVector>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs - rhs
}

public func *=<V: ConstantSizeVector>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs * rhs
}

