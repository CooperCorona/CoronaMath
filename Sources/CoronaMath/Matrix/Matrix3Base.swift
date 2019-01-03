//
//  Matrix3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A 3x3 matrix. Conforms to Equatable, MatrixBase, ConstantSizeMatrix, and SquareMatrix.
///Conforms to MatrixOperationsBase by the extensions in VariableSizeMatrix/.
public struct Matrix3Base<MatrixType> where MatrixType: MatrixElementType {

    ///The type of the matrix's elements.
    public typealias ElementType = MatrixType

    ///The number of rows and columns of the matrix.
    ///*Self.dimensions* and *self.dimensions* must equal
    ///*size* for both components.
    public static var size: Int { return 3 }

    ///The identity 3x3 matrix.
    public static var identity: Matrix3Base<MatrixType> {
        return Matrix3Base<MatrixType>(elements: [
            MatrixType.one, MatrixType.zero, MatrixType.zero,
            MatrixType.zero, MatrixType.one, MatrixType.zero,
            MatrixType.zero, MatrixType.zero, MatrixType.one
        ])
    }

    ///The values of the matrix. The number of elements must equal
    ///the number of rows times the number of columns.
    public private(set) var elements:[MatrixType]

    ///Initializes this instance with the specified elements. If *elements* does not
    ///contain enough values, the remaining elements are initialized to 0.
    ///If *elements* contains too many elements, the extra values are ignored.
    /// - parameter: an array of *ElementType* elements representing the elements of the matrix.
    /// - returns: a matrix initialized with the values of *elements*.
    public init(elements:[MatrixType]) {
        let n = Matrix3Base<MatrixType>.numberOfElements
        self.elements = elements[0..<min(n, elements.count)] + [MatrixType](repeating: MatrixType.zero, count: min(n, n - elements.count))
    }

    ///Provides access to the individual elements.
    /// - parameter index: The index of the element to get or set.
    /// - returns: The value of the element at the given index.
    public subscript(index:Int) -> MatrixType {
        get { return self.elements[index] }
        set { self.elements[index] = newValue }
    }

}

extension Matrix3Base: Equatable {}
extension Matrix3Base: MatrixBase {}
extension Matrix3Base: ConstantSizeMatrix {}
extension Matrix3Base: SquareMatrix {}
