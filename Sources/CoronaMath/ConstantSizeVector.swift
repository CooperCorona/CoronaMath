//
//  ConstantSizeVector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

public protocol ConstantSizeVector: VectorBase, Addable {

    ///The number of components in a vector. Must be greater than 0.
    ///The instance property numberOfComponents must return this value.
    static var numberOfComponents:Int { get }

    ///Computes the dot product of this vector with *vector*.
    /// - parameter vector: The vector with which to calculate the dot product.
    /// - returns: The dot product of this instance and *vector*.
    func dot(vector:Self) -> ComponentType

    ///Adds two vectors.
    static func +(lhs:Self, rhs:Self) -> Self
    ///Subtracts two vectors
    static func -(lhs:Self, rhs:Self) -> Self
    ///Multiplies two vectors component-wise.
    static func *(lhs:Self, rhs:Self) -> Self
    ///Assigns and adds two vectors.
    static func +=(lhs:inout Self, rhs:Self)
    ///Assigns and subtracts two vectors
    static func -=(lhs:inout Self, rhs:Self)
    ///Assigns and multiplies two vectors component-wise.
    static func *=(lhs:inout Self, rhs:Self)
    ///Adds a vector and a scalar.
    static func +(lhs:Self, rhs:ComponentType) -> Self
    ///Adds a scalar and a vector.
    static func +(lhs:ComponentType, rhs:Self) -> Self
    ///Subtracts a vector and a scalar.
    static func -(lhs:Self, rhs:ComponentType) -> Self
    ///Subtracts a scalar and a vector.
    static func -(lhs:ComponentType, rhs:Self) -> Self
    ///Multiplies a vector and a scalar.
    static func *(lhs:Self, rhs:ComponentType) -> Self
    ///Mutiplies a scalar and a vector.
    static func *(lhs:ComponentType, rhs:Self) -> Self
    ///Assigns and adds a vector and a scalar.
    static func +=(lhs:inout Self, rhs:ComponentType)
    ///Assigns and subtracts a vector and a scalar.
    static func -=(lhs:inout Self, rhs:ComponentType)
    ///Assigns and multiplies a vector and a scalar.
    static func *=(lhs:inout Self, rhs:ComponentType)
}

// MARK: - Default Implementations

extension ConstantSizeVector {

    public static var zero:Self { return Self(components: [ComponentType](repeating: Self.ComponentType.zero, count: Self.numberOfComponents)) }

    public var numberOfComponents:Int { return Self.numberOfComponents }

    public init(components:[ComponentType]) {
        self.init()
        for i in 0..<min(Self.numberOfComponents, components.count) {
            self[i] = components[i]
        }
    }

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

