//
//  Multiplicable.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A type that defines a multiplication operator and multiplicative identity.
public protocol Multiplicable {
    
    static var one:Self { get }
    static func *(lhs:Self, rhs:Self) -> Self
    
}

extension Int: Multiplicable {
    public static var one:Int { return 1 }
}

extension Float:Multiplicable {
    public static var one:Float { return 1.0 }
}

extension Double:Multiplicable {
    public static var one:Double { return 1.0 }
}
