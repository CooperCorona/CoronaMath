//
//  Array+Extensions.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/6/19.
//

import Foundation

extension Array {

    ///Constructs an array of exactly `length` elements.
    ///If `self` contains too many elements, the extra elements are ignored.
    ///If `self` does not contain enough elements, `padding` is appended to
    ///the end of the array until there are enough elements.
    /// - parameter length: The length of the new array. Negative lengths are treated as 0.
    /// - parameter padding: The element to repeat at the end of the array
    ///`self.count < length`.
    /// - returns: An array with exactly `length` elements.
    public func of(length: Int, padding: Element) -> [Element] {
        let n = Swift.max(length, 0)
        return self[0..<Swift.min(n, self.count)]
            + [Element](repeating: padding, count: Swift.max(0, n - self.count))
    }

}
