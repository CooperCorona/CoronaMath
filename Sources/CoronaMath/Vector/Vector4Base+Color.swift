//
//  Vector4Base+Color.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///Computed properties that allow a Vector4Base to semantically be
///treated as an RGBA color vector.
extension Vector4Base {

    ///The color white.
    public static var white:Vector4Base<Double> { return Vector4Base<Double>(components: [1.0, 1.0, 1.0, 1.0]) }
    ///The color black.
    public static var black:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 0.0, 0.0, 1.0]) }
    ///The color black with zero alpha.
    public static var clear:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 0.0, 0.0, 0.0]) }
    ///The color red.
    public static var red:Vector4Base<Double> { return Vector4Base<Double>(components: [1.0, 0.0, 0.0, 1.0]) }
    ///The color green.
    public static var green:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 1.0, 0.0, 1.0]) }
    ///The color blue.
    public static var blue:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 0.0, 1.0, 1.0]) }
    ///The color yellow.
    public static var yellow:Vector4Base<Double> { return Vector4Base<Double>(components: [1.0, 1.0, 0.0, 1.0]) }
    ///The color magenta.
    public static var magenta:Vector4Base<Double> { return Vector4Base<Double>(components: [1.0, 0.0, 1.0, 1.0]) }
    ///The color cyan.
    public static var cyan:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 1.0, 1.0, 1.0]) }
    ///The color purple.
    public static var purple:Vector4Base<Double> { return Vector4Base<Double>(components: [0.5, 0.0, 1.0, 1.0]) }
    ///The color brown.
    public static var brown:Vector4Base<Double> { return Vector4Base<Double>(components: [0.4, 0.2, 0.0, 1.0]) }
    ///The color orange.
    public static var orange:Vector4Base<Double> { return Vector4Base<Double>(components: [1.0, 0.5, 0.0, 1.0]) }
    ///The color gray.
    public static var gray:Vector4Base<Double> { return Vector4Base<Double>(components: [0.5, 0.5, 0.5, 1.0]) }
    ///The color light gray.
    public static var lightGray:Vector4Base<Double> { return Vector4Base<Double>(components: [0.75, 0.75, 0.75, 1.0]) }
    ///The color dark gray.
    public static var darkGray:Vector4Base<Double> { return Vector4Base<Double>(components: [0.25, 0.25, 0.25, 1.0]) }
    ///The color dark red.
    public static var darkRed:Vector4Base<Double> { return Vector4Base<Double>(components: [0.5, 0.0, 0.0, 1.0]) }
    ///The color dark green.
    public static var darkGreen:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 0.5, 0.0, 1.0]) }
    ///The color dark blue.
    public static var darkBlue:Vector4Base<Double> { return Vector4Base<Double>(components: [0.0, 0.0, 0.5, 1.0]) }
    
    ///The red component of the vector (equivalent to x).
    public var r:VectorType {
        get { return self[0] }
        set { self[0] = newValue }
    }
    ///The green component of the vector (equivalent to y).
    public var g:VectorType {
        get { return self[1] }
        set { self[1] = newValue }
    }
    ///The blue component of the vector (equivalent to z).
    public var b:VectorType {
        get { return self[2] }
        set { self[2] = newValue }
    }
    ///The alpha component of the vector (equivalent to w).
    public var a:VectorType {
        get { return self[3] }
        set { self[3] = newValue }
    }
    
    ///The red component of the vector (equivalent to r).
    public var red:VectorType {
        get { return self[0] }
        set { self[0] = newValue }
    }
    ///The green component of the vector (equivalent to g).
    public var green:VectorType {
        get { return self[1] }
        set { self[1] = newValue }
    }
    ///The blue component of the vector (equivalent to b).
    public var blue:VectorType {
        get { return self[2] }
        set { self[2] = newValue }
    }
    ///The blue component of the vector (equivalent to a).
    public var alpha:VectorType {
        get { return self[3] }
        set { self[3] = newValue }
    }
}
