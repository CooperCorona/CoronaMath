//
//  Sequence+Extensions.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

public protocol Addable {
    ///The value for this type that represents the additive identity zero.
    ///The result of x + Self.Zero should be x.
    static var Zero:Self { get }
    ///Adds two instaces of this type.
    static func +(lhs:Self, rhs:Self) -> Self
}

extension Sequence where Element: Addable {
    
    ///Computs the sum of this sequence.
    public func sum() -> Element {
        return self.reduce(Element.Zero, +)
    }
    
}

extension Int: Addable {
    public static var Zero:Int { return 0 }
}

extension Float: Addable {
    public static var Zero:Float { return 0.0 }
}

extension Double: Addable {
    public static var Zero:Double { return 0.0 }
}
