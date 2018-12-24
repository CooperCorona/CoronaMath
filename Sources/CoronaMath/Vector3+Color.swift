//
//  Vector3+Color.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///Computed properties that allow a Vector3 to semantically be
///treated as an RGB color vector.
extension Vector3 {
    
    public static let white = Vector3(components: [1.0, 1.0, 1.0])
    public static let black = Vector3(components: [0.0, 0.0, 0.0])
    public static let red = Vector3(components: [1.0, 0.0, 0.0])
    public static let green = Vector3(components: [0.0, 1.0, 0.0])
    public static let blue = Vector3(components: [0.0, 0.0, 1.0])
    public static let yellow = Vector3(components: [1.0, 1.0, 0.0])
    public static let magenta = Vector3(components: [1.0, 0.0, 1.0])
    public static let cyan = Vector3(components: [0.0, 1.0, 1.0])
    public static let purple = Vector3(components: [0.5, 0.0, 1.0])
    public static let brown = Vector3(components: [0.4, 0.2, 0.0])
    public static let orange = Vector3(components: [1.0, 0.5, 0.0])
    public static let gray = Vector3(components: [0.5, 0.5, 0.5])
    public static let lightGray = Vector3(components: [0.75, 0.75, 0.75])
    public static let darkGray = Vector3(components: [0.25, 0.25, 0.25])
    public static let darkRed = Vector3(components: [0.5, 0.0, 0.0])
    public static let darkGreen = Vector3(components: [0.0, 0.5, 0.0])
    public static let darkBlue = Vector3(components: [0.0, 0.0, 0.5])
    
    ///The red component of the vector (equivalent to x).
    public var r:Double {
        get { return self[0] }
        set { self[0] = newValue }
    }
    ///The green component of the vector (equivalent to y).
    public var g:Double {
        get { return self[1] }
        set { self[1] = newValue }
    }
    ///The blue component of the vector (equivalent to z).
    public var b:Double {
        get { return self[2] }
        set { self[2] = newValue }
    }
    
    ///The red component of the vector (equivalent to r).
    public var red:Double {
        get { return self[0] }
        set { self[0] = newValue }
    }
    ///The green component of the vector (equivalent to g).
    public var green:Double {
        get { return self[1] }
        set { self[1] = newValue }
    }
    ///The blue component of the vector (equivalent to b).
    public var blue:Double {
        get { return self[2] }
        set { self[2] = newValue }
    }
}
