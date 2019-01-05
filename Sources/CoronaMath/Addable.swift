//
//  Addable.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/4/19.
//

import Foundation

public protocol Addable {
    ///The value for this type that represents the additive identity zero.
    ///The result of x + Self.Zero should be x.
    static var zero:Self { get }
    ///Adds two instaces of this type.
    static func +(lhs:Self, rhs:Self) -> Self
}

extension Int: Addable {
    public static var zero:Int { return 0 }
}

extension Float: Addable {
    public static var zero:Float { return 0.0 }
}

extension Double: Addable {
    public static var zero:Double { return 0.0 }
}
