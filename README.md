# CoronaMath

CoronaMath is a cross-platform vector and matrix library for Swift. All types are parameterized, so any type that defines a set of mathematical operations can be used as components of a vector or elements of a matrix. Where applicable, protocols declare default implementations of their methods. This way, types can opt-in to a wide spectrum of behavior while only declaring minimal required properties.

Comprehensive documentation can be found [here](https://coopercorona.github.io/CoronaMath/).

# Vectors
All vectors are represented as an array of components of a given type. All vectors are declared with the suffix `Base` to represent that you will usually be dealing with an abstracted version instead of the type directly.

---
## Protocols

### VectorBase
Represents a vector. Declares size, elements, and element access.

### SignedVectorBase
Represents a vector whose components have a sign. Includes the mathematical negation operator `-`.

### FloatingPointVectorBase
Represents a vector whose components are floating point. Includes `length`, `dot`, and `unit` methods.

---
## Structs

### PointBase
A 2-dimensional vector. Exposes `x` and `y` properties for convenience, along with `rows` and `columns` for matrix dimensions semantics. `Point` is equivalent to `PointBase<Double>`. `IntPoint` is equivalent to `PointBase<Int>`.

### Vector3Base
A 3-dimensional vector. Exposes `x`, `y`, and `z` properties for convenience. Exposes `r`, `g`, `b`, and `red`, `green`, `blue` properties to semantically represent RGB colors. `Vector3Base+Color` declares some common color names as static properties.

### Vector4Base
A 4-dimensional vector. Exposes `x`, `y`, `z`, and `w` properties for convenience. Exposes `r`, `g`, `b`, `a` and `red`, `green`, `blue`, `alpha` properties to semantically represent RGBA colors (including an alpha component). `Vector4Base+Color` declares some common color names as static properties.

---

# Matrices
All matrices are represented as an array of elements of a given type. All vectors are declared with the suffix `Base` to represent that you will usually be dealing with an abstracted version instead of the type directly.

Although logically, a matrix declares many mathematical operations, in practice, most of those operations aren't needed for many types. Therefore, the operations have been moved from `MatrixBase` (the protocol representing a matrix) to `MatrixOperationsBase`. `ConstantSizeMatrix` and `SquareMatrix` provide default implementations of some of these operations.

---
## Protocols

### MatrixBase
Represents a matrix. Declares dimensions, elements, element access, and matrix multiplication.

### MatrixOperationsBase
Represents a matrix with the full spectrum of mathematical operations.

### ConstantSizeMatrix
Represents a matrix whose dimensions are known at compile time.

### SquareMatrix
Represents a matrix whose dimensions are known at compile time and whose number of rows equal its number of columns.

---
## Structs

### Matrix3Base
A 3x3 matrix.

### Matrix4Base
A 4x4 matrix.

### VariableSizeMatrix
A matrix whose dimensions are determined at runtime. Once a `VariableSizeMatrix` is created, its dimensions cannot be changed, but different instances can have different dimensions.
