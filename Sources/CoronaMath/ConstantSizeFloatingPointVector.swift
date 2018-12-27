//
//  ConstantSizeFloatingPointVector.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A vector whose number of components is defined at compile time and whose
///components are of type FloatingPoint.
public protocol ConstantSizeFloatingPointVector: FloatingPointVector, ConstantSizeVector {

    ///Computes the distance between 2 vcctors.
    /// - parameter vector: the vector to compute the distance from.
    /// - returns: The distance between this vector and *vector*.
    func distanceFrom(vector:Self) -> ComponentType
}

extension ConstantSizeFloatingPointVector {

    public func distanceFrom(vector:Self) -> Self.ComponentType {
        return (self - vector).length()
    }

}
