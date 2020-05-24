//
//  FloatingPointVector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/25/18.
//

import Foundation

///A vector whose components are continuous numbers.
public protocol ContinuousVector: VectorBase where Self.ComponentType: ContinuousNumber  {

    // MARK: - Optional Implementations

    ///The length of this vector.
    /// - returns: The length of this vector.
    func length() -> ComponentType
    
    ///Calculates a vector parallel to `self` with length 1.0.
    /// - returns: a vector parallel to `self` with length 1.0.
    func unit() -> Self

    ///Negates the vector, returning a vector with the negative of all components.
    static prefix func -(lhs:Self) -> Self
    
    ///Divides two vectors component-wise.
    static func /(lhs:Self, rhs:Self) -> Self
    ///Assigns and divides two vectors component-wise.
    static func /=(lhs:inout Self, rhs:Self)
    ///Divides a vector and a scalar.
    static func /(lhs:Self, rhs:ComponentType) -> Self
    ///Divides a vector and a scalar.
    static func /(lhs:ComponentType, rhs:Self) -> Self
    ///Assigns and divides a vector and a scalar.
    static func /=(lhs:inout Self, rhs:ComponentType)
}

// MARK: - Default Implementations

extension ContinuousVector {
    
    public func length() -> ComponentType {
        return ComponentType.sqrt(self.components.map() { $0 * $0 } .sum())
    }
    
    public func unit() -> Self {
        let length = self.length()
        return Self(components: self.components.map() { $0 / length })
    }
    
}
public prefix func -<V: ContinuousVector>(lhs:V) -> V {
    return V(components: lhs.components.map() { -$0 })
}

public func /<V: ContinuousVector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 / $1 })
}

public func /=<V: ContinuousVector>(lhs:inout V, rhs:V) {
    lhs = lhs / rhs
}

public func /<V: ContinuousVector>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 / rhs })
}

public func /<V: ContinuousVector>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs / $0 })
}

public func /=<V: ContinuousVector>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs / rhs
}
