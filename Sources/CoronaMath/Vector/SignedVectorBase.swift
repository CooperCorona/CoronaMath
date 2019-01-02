//
//  SignedVectorBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/25/18.
//

import Foundation

///A vector whose components are signed numerics.
public protocol SignedVectorBase: VectorBase where Self.ComponentType: SignedNumeric {
    
    ///Negates the vector, returning a vector with the negative of all components.
    static prefix func -(lhs:Self) -> Self
    
}

public prefix func -<V: SignedVectorBase>(lhs:V) -> V {
    return V(components: lhs.components.map() { -$0 })
}
