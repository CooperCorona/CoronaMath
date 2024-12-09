//
//  Sequence+Extensions.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///An iterator that iterates over pairs of elements in `firstSequence` and `secondSequence`.
///`secondSequence` must not destructively consume its contents.
///
///For example, the first element generated is `(firstSequence[0], secondSequence[0])`, the second element
///is `(firstSequence[0], secondSequence[1])`, all the way to `(firstSequence[0]. secondSequence.last)`,
///at which point the next element is `(firstSequence[1], secondSequence[0])`.
///```
///for (x, y) in pairs(firstSequence, secondSequence) {
///    //...
///}
///```
///is equivalent to
///```
///for x in firstSequence {
///    for y in secondSequence {
///        //...
///    }
///}
///```
public struct PairIterator<T, U>: Sequence, IteratorProtocol where T: Sequence, U: Sequence {

    ///The first sequence to iterate over. Elements of this sequence
    ///occur first in the generated tuples.
    private let firstSequence: T
    ///The second sequence to iterate over. Elements of this sequence
    ///occur second in the generated tuples.
    private let secondSequence: U
    ///An iterator over the `firstSequence`.
    private var firstIterator: T.Iterator
    ///An iterator over the `secondSequence`.
    private var secondIterator: U.Iterator
    ///The current first element of the generated tuple.
    private var firstElement: T.Element? = nil

    ///Initializes a PairIterator instance.
    /// - paramter firstSequence: The first sequence to iterate over.
    /// - parameter secondSequence: The second sequence to iterate over.
    public init(firstSequence: T, secondSequence: U) {
        self.firstSequence = firstSequence
        self.secondSequence = secondSequence
        self.firstIterator = firstSequence.makeIterator()
        self.secondIterator = secondSequence.makeIterator()
        self.firstElement = self.firstIterator.next()
    }

    ///Returns the next element in the sequence, or `nil` if the sequence is done iterating.
    /// - returns: A tuple containing an element in the first sequence and an element in the
    ///second sequence.
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

    ///Updates the iterators to advance the first iterator to its next element
    ///and reset the second iterator to its first element.
    private mutating func advanceFirstIterator() {
        self.firstElement = self.firstIterator.next()
        self.secondIterator = self.secondSequence.makeIterator()
    }

    ///Returns an iterator that can be
    public func makeIterator() -> PairIterator<T, U> {
        return self
    }
}

extension Sequence where Element: DiscreteNumber {

    ///Computes the sum of this sequence.
    public func sum() -> Element {
        return self.reduce(Element.zero, +)
    }
}

extension Sequence {

    ///Returns an iterator that generates all pairs of elements in this sequence in order.
    ///See `PairIterator`.
    /// - returns: A PairIterator iterating over the pairs of the sequences.
    public func makePairs() -> PairIterator<Self, Self>.Iterator {
        return PairIterator(firstSequence: self, secondSequence: self)
    }
}

///Returns an iterator that iterates over pairs of elements in
///`firstSequence` and `secondSequence`. See `PairIterator`.
/// - parameter firstSequence: The first sequence to iterate over.
/// - parameter secondSequence: The second sequence to iterate over.
/// - returns: A PairIterator iterating over the pairs of the sequences.
public func pairs<T, U>(_ firstSequence: T, _ secondSequence: U) -> PairIterator<T, U>.Iterator
where T: Sequence, U: Sequence {
    return PairIterator(firstSequence: firstSequence, secondSequence: secondSequence)
}
