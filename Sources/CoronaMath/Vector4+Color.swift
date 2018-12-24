//
//  Vector4+Color.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///Computed properties that allow a Vector4 to semantically be
///treated as an RGBA color vector.
extension Vector4 {
    
    public static let White = Vector4(components: [1.0, 1.0, 1.0, 1.0])
    public static let Black = Vector4(components: [0.0, 0.0, 0.0, 1.0])
    public static let Clear = Vector4(components: [0.0, 0.0, 0.0, 0.0])
    public static let Red = Vector4(components: [1.0, 0.0, 0.0, 1.0])
    public static let Green = Vector4(components: [0.0, 1.0, 0.0, 1.0])
    public static let Blue = Vector4(components: [0.0, 0.0, 1.0, 1.0])
    public static let Yellow = Vector4(components: [1.0, 1.0, 0.0, 1.0])
    public static let Magenta = Vector4(components: [1.0, 0.0, 1.0, 1.0])
    public static let Cyan = Vector4(components: [0.0, 1.0, 1.0, 1.0])
    public static let Purple = Vector4(components: [0.5, 0.0, 1.0, 1.0])
    public static let Brown = Vector4(components: [0.4, 0.2, 0.0, 1.0])
    public static let Orange = Vector4(components: [1.0, 0.5, 0.0, 1.0])
    public static let Gray = Vector4(components: [0.5, 0.5, 0.5, 1.0])
    public static let LightGray = Vector4(components: [0.75, 0.75, 0.75, 1.0])
    public static let DarkGray = Vector4(components: [0.25, 0.25, 0.25, 1.0])
    public static let DarkRed = Vector4(components: [0.5, 0.0, 0.0, 1.0])
    public static let DarkGreen = Vector4(components: [0.0, 0.5, 0.0, 1.0])
    public static let DarkBlue = Vector4(components: [0.0, 0.0, 0.5, 1.0])
    
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
    ///The alpha component of the vector (equivalent to w).
    public var a:Double {
        get { return self[3] }
        set { self[3] = newValue }
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
    ///The blue component of the vector (equivalent to a).
    public var alpha:Double {
        get { return self[3] }
        set { self[3] = newValue }
    }
}
