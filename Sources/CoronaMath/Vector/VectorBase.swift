//
//  VectorBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///Interface for a mathematical n-component vector, which is a
///a structure that contains n independent numeric components.
public protocol VectorBase: Equatable {
    
    // MARK: - Required Methods

    ///The type of the vector's components.
    associatedtype ComponentType: Numeric, Addable

    ///The number of components in the vector.
    var numberOfComponents:Int { get }

    ///The components of this vector.
    var components:[ComponentType] { get }
    
    ///Provides access to the individual components.
    /// - parameter index: The index of the component to get or set.
    /// - returns: The value of the component at the given index.
    subscript(index:Int) -> ComponentType { get set }
    
    // MARK: - Optional Implementations
    
    ///Initializes this instance with all zeroes.
    init()
    
    ///Initializes this instance with the specified components. If *components* does not
    ///contain enough elements, the remaining components should be initialized to 0.
    ///If *components* contains too many elements, the extra elements should be ignored.
    /// - parameter: an array of V.ComponentTypes representing the component of the vector.
    /// - returns: a vector initialized with the values of *components*.
    init(components:[ComponentType])

    ///Compares two vectors component wise. Returns true if the vectors' components are the same, false otherwise.
    static func ==(lhs:Self, rhs:Self) -> Bool
    
}

// MARK: - Default Implementations

public func ==<V: VectorBase>(lhs:V, rhs:V) -> Bool {
    return lhs.components == rhs.components
}
