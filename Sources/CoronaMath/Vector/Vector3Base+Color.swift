//
//  Vector3Base+Color.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///Computed properties that allow a Vector3Base to semantically be
///treated as an RGB color vector.
extension Vector3Base {

    ///The color white.
    public static var white:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 1.0, 1.0]) }
    ///The color black.
    public static var black:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 0.0, 0.0]) }
    ///The color red.
    public static var red:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 0.0, 0.0]) }
    ///The color green.
    public static var green:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 1.0, 0.0]) }
    ///The color blue.
    public static var blue:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 0.0, 1.0]) }
    ///The color yellow.
    public static var yellow:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 1.0, 0.0]) }
    ///The color magenta.
    public static var magenta:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 0.0, 1.0]) }
    ///The color cyan.
    public static var cyan:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 1.0, 1.0]) }
    ///The color purple.
    public static var purple:Vector3Base<Double> { return Vector3Base<Double>(components: [0.5, 0.0, 1.0]) }
    ///The color brown.
    public static var brown:Vector3Base<Double> { return Vector3Base<Double>(components: [0.4, 0.2, 0.0]) }
    ///The color orange.
    public static var orange:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 0.5, 0.0]) }
    ///The color gray.
    public static var gray:Vector3Base<Double> { return Vector3Base<Double>(components: [0.5, 0.5, 0.5]) }
    ///The color light gray.
    public static var lightGray:Vector3Base<Double> { return Vector3Base<Double>(components: [0.75, 0.75, 0.75]) }
    ///The color dark gray.
    public static var darkGray:Vector3Base<Double> { return Vector3Base<Double>(components: [0.25, 0.25, 0.25]) }
    ///The color dark red.
    public static var darkRed:Vector3Base<Double> { return Vector3Base<Double>(components: [0.5, 0.0, 0.0]) }
    ///The color dark green.
    public static var darkGreen:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 0.5, 0.0]) }
    ///The color dark blue.
    public static var darkBlue:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 0.0, 0.5]) }
    
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
}
