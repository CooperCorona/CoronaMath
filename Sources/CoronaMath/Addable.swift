//
//  Addable.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/4/19.
//

import Foundation

///A type that defines an addition operator and an additive identity.
public protocol Addable {
    ///The value for this type that represents the additive identity zero.
    ///The result of x + Self.zero should be x.
    static var zero:Self { get }
    ///Adds two instances of this type.
    static func +(lhs:Self, rhs:Self) -> Self
}

///Conforms Int to Addable.
extension Int: Addable {
    ///The additive identity 0.
    public static var zero:Int { return 0 }
}
///Conforms Float to Addable.
extension Float: Addable {
    ///The additive identity 0.0.
    public static var zero:Float { return 0.0 }
}
///Conforms Double to Addable.
extension Double: Addable {
    ///The additive identity 0.0.
    public static var zero:Double { return 0.0 }
}
