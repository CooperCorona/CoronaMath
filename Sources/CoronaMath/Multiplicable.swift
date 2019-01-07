//
//  Multiplicable.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A type that defines a multiplication operator and multiplicative identity.
public protocol Multiplicable {

    ///The value for this type that represents the multiplicative identity zero.
    ///The result of x * Self.one should be x.
    static var one:Self { get }
    ///Multiplies two elements of this type.
    static func *(lhs:Self, rhs:Self) -> Self
    
}

///Conforms Int to Multiplicable.
extension Int: Multiplicable {
    ///The multiplicative identity 1.
    public static var one:Int { return 1 }
}

///Conforms Float to Multiplicable.
extension Float: Multiplicable {
    ///The multiplicative identity 1.0.
    public static var one:Float { return 1.0 }
}

///Conforms Double to Multiplicable.
extension Double: Multiplicable {
    ///The multiplicative identity 1.0.
    public static var one:Double { return 1.0 }
}
