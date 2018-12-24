//
//  Point.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///A 2-dimensional vector.
public struct Point: Vector {
    
    ///The point with 0 for all components.
    public static let zero = Point(components: [0.0, 0.0])
    ///The unit vector in the x direction.
    public static let x = Point(components: [1.0, 0.0])
    ///The unit vector in the y direction.
    public static let y = Point(components: [0.0, 1.0])
    
    public static let numberOfComponents = 2
    
    public private(set) var components: [Double] = [Double](repeating: 0.0, count: Point.numberOfComponents)
    
    ///The x coordinate of the point (the first component of the vector).
    public var x:Double {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the point (the second component of the vector).
    public var y:Double {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    
    public init() {}
    
    public init(x:Double, y:Double) {
        self.components = [x, y]
    }
    
    public subscript(index: Int) -> Double {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}
