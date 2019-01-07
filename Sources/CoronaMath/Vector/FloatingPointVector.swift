//
//  FloatingPointVector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/25/18.
//

import Foundation

///A vector whose components are floating point numbers.
public protocol FloatingPointVector: SignedVectorBase where Self.ComponentType: FloatingPoint  {

    // MARK: - Optional Implementations

    ///The length of this vector.
    /// - returns: The length of this vector.
    func length() -> ComponentType
    
    ///Calculates a vector parallel to `self` with length 1.0.
    /// - returns: a vector parallel to `self` with length 1.0.
    func unit() -> Self
    
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

extension FloatingPointVector {
    
    public func length() -> Self.ComponentType {
        return sqrt(self.components.map() { $0 * $0 } .sum())
    }
    
    public func unit() -> Self {
        let length = self.length()
        return Self(components: self.components.map() { $0 / length })
    }
    
}

public func /<V: FloatingPointVector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 / $1 })
}

public func /=<V: FloatingPointVector>(lhs:inout V, rhs:V) {
    lhs = lhs / rhs
}

public func /<V: FloatingPointVector>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 / rhs })
}

public func /<V: FloatingPointVector>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs / $0 })
}

public func /=<V: FloatingPointVector>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs / rhs
}
