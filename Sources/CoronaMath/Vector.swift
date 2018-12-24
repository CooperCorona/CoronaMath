//
//  Vector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///Interface for a mathematical n-component vector, which is a
///a structure that contains n independent real numbers.
public protocol Vector: Equatable {
    
    // MARK: - Required Methods
    
    ///The number of components in a vector. Must be greater than 0.
    static var numberOfComponents:Int { get }
    
    ///The components of this vector.
    var components:[Double] { get }
    
    ///Provides access to the individual components.
    /// - parameter index: The index of the component to get or set.
    /// - returns: The value of the component at the given index.
    subscript(index:Int) -> Double { get set }
    
    // MARK: - Methods with Default Implementations
    
    ///Initializes this instance with all zeroes.
    init()
    
    ///Initializes this instance with the specified components. If *components* does not
    ///contain enough elements, the remaining components should be initialized to 0.
    ///If *components* contains too many elements, the extra elements should be ignored.
    /// - parameter: an array of doubles representing the component of the vector.
    /// - returns: a vector initialized with the values of *components*.
    init(components:[Double])
    
    ///The length of this vector.
    /// - returns: The length of this vector.
    func length() -> Double
    
    ///Calculates a vector parallel to this one but with length 1.0.
    /// - returns: a vector parallel to this one but with length 1.0.
    func unit() -> Self
    
    ///Computes the dot product of this vector with *vector*.
    /// - parameter vector: The vector with which to calculate the dot product.
    /// - returns: The dot product of this instance and *vector*.
    func dot(vector:Self) -> Double
    
    ///Computes the distance between 2 vcctors.
    /// - parameter vector: the vector to compute the distance from.
    /// - returns: The distance between this vector and *vector*.
    func distanceFrom(vector:Self) -> Double
    
    ///Adds two vectors.
    static func +(lhs:Self, rhs:Self) -> Self
    ///Subtracts two vectors
    static func -(lhs:Self, rhs:Self) -> Self
    ///Multiplies two vectors component-wise.
    static func *(lhs:Self, rhs:Self) -> Self
    ///Divides two vectors component-wise.
    static func /(lhs:Self, rhs:Self) -> Self
    ///Assigns and adds two vectors.
    static func +=(lhs:inout Self, rhs:Self)
    ///Assigns and subtracts two vectors
    static func -=(lhs:inout Self, rhs:Self)
    ///Assigns and multiplies two vectors component-wise.
    static func *=(lhs:inout Self, rhs:Self)
    ///Assigns and divides two vectors component-wise.
    static func /=(lhs:inout Self, rhs:Self)
    ///Adds a vector and a scalar.
    static func +(lhs:Self, rhs:Double) -> Self
    ///Adds a scalar and a vector.
    static func +(lhs:Double, rhs:Self) -> Self
    ///Subtracts a vector and a scalar.
    static func -(lhs:Self, rhs:Double) -> Self
    ///Subtracts a scalar and a vector.
    static func -(lhs:Double, rhs:Self) -> Self
    ///Multiplies a vector and a scalar.
    static func *(lhs:Self, rhs:Double) -> Self
    ///Mutiplies a scalar and a vector.
    static func *(lhs:Double, rhs:Self) -> Self
    ///Divides a vector and a scalar.
    static func /(lhs:Self, rhs:Double) -> Self
    ///Divides a vector and a scalar.
    static func /(lhs:Double, rhs:Self) -> Self
    ///Assigns and adds a vector and a scalar.
    static func +=(lhs:inout Self, rhs:Double)
    ///Assigns and subtracts a vector and a scalar.
    static func -=(lhs:inout Self, rhs:Double)
    ///Assigns and multiplies a vector and a scalar.
    static func *=(lhs:inout Self, rhs:Double)
    ///Assigns and divides a vector and a scalar.
    static func /=(lhs:inout Self, rhs:Double)
    
    ///Negates the vector, returning a vector with the negative of all components.
    static prefix func -(lhs:Self) -> Self
    
    ///Compares two vectors component wise. Returns true if the vectors' components are the same, false otherwise.
    static func ==(lhs:Self, rhs:Self) -> Bool
    
}

// MARK: - Default Implementations

extension Vector {
    
    public static var Zero:Self { return Self(components: [Double](repeating: 0.0, count: Point.numberOfComponents)) }
    
    public init(components:[Double]) {
        self.init()
        for i in 0..<min(Point.numberOfComponents, components.count) {
            self[i] = components[i]
        }
    }
    
    public func length() -> Double {
        return sqrt(self.components.map() { $0 * $0 } .sum())
    }
    
    public func unit() -> Self {
        let length = self.length()
        return Self(components: self.components.map() { $0 / length })
    }
    
    public func dot(vector:Self) -> Double {
        return zip(self.components, vector.components).map() { $0 * $1 } .sum()
    }
    
    public func distanceFrom(vector:Self) -> Double {
        return (self - vector).length()
    }
    
}

// MARK: - Operator Overloads

public func +<V: Vector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 + $1 })
}

public func -<V: Vector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 - $1 })
}

public func *<V: Vector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 * $1 })
}

public func /<V: Vector>(lhs:V, rhs:V) -> V {
    return V(components: zip(lhs.components, rhs.components).map() { $0 / $1 })
}

public func +=<V: Vector>(lhs:inout V, rhs:V) {
    lhs = lhs + rhs
}

public func -=<V: Vector>(lhs:inout V, rhs:V) {
    lhs = lhs - rhs
}

public func *=<V: Vector>(lhs:inout V, rhs:V) {
    lhs = lhs * rhs
}

public func /=<V: Vector>(lhs:inout V, rhs:V) {
    lhs = lhs / rhs
}

public func +<V: Vector>(lhs:V, rhs:Double) -> V {
    return V(components: lhs.components.map() { $0 + rhs })
}

public func +<V: Vector>(lhs:Double, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs + $0 })
}

public func -<V: Vector>(lhs:V, rhs:Double) -> V {
    return V(components: lhs.components.map() { $0 - rhs })
}

public func -<V: Vector>(lhs:Double, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs - $0 })
}

public func *<V: Vector>(lhs:V, rhs:Double) -> V {
    return V(components: lhs.components.map() { $0 * rhs })
}

public func *<V: Vector>(lhs:Double, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs * $0 })
}

public func /<V: Vector>(lhs:V, rhs:Double) -> V {
    return V(components: lhs.components.map() { $0 / rhs })
}

public func /<V: Vector>(lhs:Double, rhs:V) -> V {
    return V(components: rhs.components.map() { lhs / $0 })
}

public func +=<V: Vector>(lhs:inout V, rhs:Double) {
    lhs = lhs + rhs
}

public func -=<V: Vector>(lhs:inout V, rhs:Double) {
    lhs = lhs - rhs
}

public func *=<V: Vector>(lhs:inout V, rhs:Double) {
    lhs = lhs * rhs
}

public func /=<V: Vector>(lhs:inout V, rhs:Double) {
    lhs = lhs / rhs
}

public prefix func -<V: Vector>(lhs:V) -> V {
    return V(components: lhs.components.map() { -$0 })
}

public func ==<V: Vector>(lhs:V, rhs:V) -> Bool {
    return lhs.components == rhs.components
}
