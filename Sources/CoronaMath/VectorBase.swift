//
//  VectorBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///Interface for a mathematical n-component vector, which is a
///a structure that contains n independent numeric components..
public protocol VectorBase: Equatable, Addable {
    
    // MARK: - Required Methods
    
    associatedtype ComponentType: Numeric, Addable
    
    ///The number of components in a vector. Must be greater than 0.
    static var numberOfComponents:Int { get }
    
    ///The components of this vector.
    var components:[ComponentType] { get }
    
    ///Provides access to the individual components.
    /// - parameter index: The index of the component to get or set.
    /// - returns: The value of the component at the given index.
    subscript(index:Int) -> ComponentType { get set }
    
    // MARK: - Methods with Default Implementations
    
    ///Initializes this instance with all zeroes.
    init()
    
    ///Initializes this instance with the specified components. If *components* does not
    ///contain enough elements, the remaining components should be initialized to 0.
    ///If *components* contains too many elements, the extra elements should be ignored.
    /// - parameter: an array of V.ComponentTypes representing the component of the vector.
    /// - returns: a vector initialized with the values of *components*.
    init(components:[ComponentType])
    
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
    
    ///Compares two vectors component wise. Returns true if the vectors' components are the same, false otherwise.
    static func ==(lhs:Self, rhs:Self) -> Bool
    
}

// MARK: - Default Implementations

extension VectorBase {
    
    public static var zero:Self { return Self(components: [ComponentType](repeating: Self.ComponentType.zero, count: Self.numberOfComponents)) }
    
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

public func +<V: VectorBase>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 + $1 })
}

public func -<V: VectorBase>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 - $1 })
}

public func *<V: VectorBase>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 * $1 })
}

public func +=<V: VectorBase>(lhs:inout V, rhs:V) {
    lhs = lhs + rhs
}

public func -=<V: VectorBase>(lhs:inout V, rhs:V) {
    lhs = lhs - rhs
}

public func *=<V: VectorBase>(lhs:inout V, rhs:V) {
    lhs = lhs * rhs
}

public func +<V: VectorBase>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 + rhs })
}

public func +<V: VectorBase>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs + $0 })
}

public func -<V: VectorBase>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 - rhs })
}

public func -<V: VectorBase>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs - $0 })
}

public func *<V: VectorBase>(lhs:V, rhs:V.ComponentType) -> V {
    return V(components: lhs.components.map() { $0 * rhs })
}

public func *<V: VectorBase>(lhs:V.ComponentType, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs * $0 })
}

public func +=<V: VectorBase>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs + rhs
}

public func -=<V: VectorBase>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs - rhs
}

public func *=<V: VectorBase>(lhs:inout V, rhs:V.ComponentType) {
    lhs = lhs * rhs
}

public func ==<V: VectorBase>(lhs:V, rhs:V) -> Bool {
    return lhs.components == rhs.components
}
