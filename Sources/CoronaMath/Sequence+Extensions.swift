//
//  Sequence+Extensions.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

public struct PairIterator<T, U>: Sequence, IteratorProtocol where T: Sequence, U: Sequence {

    private let firstSequence:T
    private let secondSequence:U
    private var firstIterator:T.Iterator
    private var secondIterator:U.Iterator
    private var firstElement:T.Element? = nil

    public init(firstSequence:T, secondSequence:U) {
        self.firstSequence = firstSequence
        self.secondSequence = secondSequence
        self.firstIterator = firstSequence.makeIterator()
        self.secondIterator = secondSequence.makeIterator()
        self.firstElement = self.firstIterator.next()
    }

    public mutating func next() -> (T.Element, U.Element)? {
        guard let firstElement = self.firstElement else {
            return nil
        }
        if let secondElement = self.secondIterator.next() {
            return (firstElement, secondElement)
        } else {
            self.advanceFirstIterator()
            return self.next()
        }
    }

    private mutating func advanceFirstIterator() {
        self.firstElement = self.firstIterator.next()
        self.secondIterator = self.secondSequence.makeIterator()
    }

    public func makeIterator() -> PairIterator<T, U> {
        return self
    }
}

extension Sequence where Element: Addable {
    
    ///Computs the sum of this sequence.
    public func sum() -> Element {
        return self.reduce(Element.zero, +)
    }

    public func makePairs() -> PairIterator<Self, Self>.Iterator {
        return PairIterator(firstSequence: self, secondSequence: self)
    }
}

public func pairs<T, U>(_ firstSequence:T, _ secondSequence:U) -> PairIterator<T, U>.Iterator where T: Sequence, U: Sequence {
    return PairIterator(firstSequence: firstSequence, secondSequence: secondSequence)
}
