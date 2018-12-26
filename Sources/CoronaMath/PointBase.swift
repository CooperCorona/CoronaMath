//
//  PointBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///A 2-dimensional vector.
public struct PointBase<VectorType> where VectorType: Addable {
    
    ///The unit vector in the x direction.
    public static var x:PointBase<Double> { return PointBase<Double>(components: [1.0, 0.0]) }
    ///The unit vector in the y direction.
    public static var y:PointBase<Double> { return PointBase<Double>(components: [0.0, 1.0]) }

    public static var numberOfComponents: Int { return 2 }
    
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: PointBase.numberOfComponents)
    
    ///The x coordinate of the PointBase (the first component of the vector).
    public var x:VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the PointBase (the second component of the vector).
    public var y:VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    
    public init() {}
    
    public init(x:VectorType, y:VectorType) {
        self.components = [x, y]
    }
    
    public subscript(index: Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}

extension PointBase: Addable where VectorType: Numeric & Addable {}
extension PointBase: Equatable where VectorType: Equatable {}
extension PointBase: VectorBase where VectorType: Numeric {}
extension PointBase: SignedVectorBase where VectorType: SignedNumeric {}
extension PointBase: FloatingPointVector where VectorType: FloatingPoint {}
