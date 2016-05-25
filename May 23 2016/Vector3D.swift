//
//  Vector3D.swift
//  MatrixTest
//
//  Created by Student on 2016-04-26.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

// inlined member functions

// ------------------------------------------------------------------------ unary minus
// this does not change the current vector
// this allows ShadeRec objects to be declared as constant arguments in many shading
// functions that reverse the direction of a ray that's stored in the ShadeRec object

prefix func -(v:Vector3D) -> Vector3D {
    return (Vector3D(_x: -v.x, _y: -v.y, _z: -v.z))
}




// ----------------------------------------------------------------------- operator*
// multiplication by a double on the right


func * (let lhs:Vector3D, let rhs:Double) ->Vector3D {
    return (Vector3D(_x: lhs.x * rhs, _y: lhs.y * rhs, _z: lhs.z * rhs));
}

// ----------------------------------------------------------------------- operator/
// division by a double


func /(let lhs:Vector3D,let rhs:Double) ->Vector3D
{
    return (Vector3D(_x: lhs.x / rhs, _y: lhs.y / rhs, _z: lhs.z / rhs));
}


// ----------------------------------------------------------------------- operator+
// addition

func +(let rhs:Vector3D, let lhs: Vector3D) ->Vector3D {
    return (Vector3D(_x:rhs.x + lhs.x, _y:rhs.y + lhs.y, _z: rhs.z + lhs.z));
}


// ----------------------------------------------------------------------- operator-
// subtraction

func -(let lhs:Vector3D, let rhs:Vector3D) -> Vector3D
{
    return (Vector3D(_x: lhs.x - rhs.x, _y: lhs.y - rhs.y, _z: lhs.z - rhs.z))
}


// ----------------------------------------------------------------------- operator*
// dot product


func *(let lhs:Vector3D, let rhs:Vector3D) -> Double {
    return (lhs.x * rhs.x + lhs.y * rhs.y + lhs.z * rhs.z);
}


// ----------------------------------------------------------------------- operator^
// cross product

func ^(let lhs: Vector3D, let rhs:Vector3D) -> Vector3D
{
    return (Vector3D(_x: lhs.y * rhs.z - lhs.z * rhs.y, _y: lhs.z * rhs.x - lhs.x * rhs.z, _z: lhs.x * rhs.y - lhs.y * rhs.x))
}


// ---------------------------------------------------------------------  operator+=
// compound addition

func +=(lhs:Vector3D, let rhs:Vector3D) {
    lhs.x += rhs.x; lhs.y += rhs.y; lhs.z += rhs.z;
    }




// inlined non-member function

// ----------------------------------------------------------------------- operator*
// multiplication by a double on the left

func *(let a:Double, let v:Vector3D) -> Vector3D {
    return (Vector3D(_x: a * v.x, _y: a * v.y, _z: a * v.z));
}


class Vector3D {
    var x,y,z: Double
    
    init()
    {
        x = 0.0
        y = 0.0
        z = 0.0
    }
    
    init( a: Double)
    {
        x = a
        y = a
        z = a
    }
    
    init( _x: Double, _y: Double, _z: Double)
    {
        x = _x
        y = _y
        z = _z
    }
    
    init(vector: Vector3D)
    {
        x = vector.x
        y = vector.y
        z = vector.z
    }
    
    init(n: Normal)
    {
        x = n.x
        y = n.y
        z = n.z
    }
    
    init(p: Point3D)
    {
        x = p.x
        y = p.y
        z = p.z
    }
    
    func length() -> Double
    {
        var length: Double
        length = sqrt(x*x + y*y + z*z)
        return length
    }
    
    func normalize()
    {
        let length: Double = sqrt(x*x + y*y + z*z)
        x /= length
        y /= length
        z /= length
    }
    
    //converts the vector to a unit vector and return the vector
    func hat()
    {
        let length: Double = sqrt(x*x + y*y + z*z)
        x /= length
        y /= length
        z /= length
        return()
    }
    
    // ---------------------------------------------------------------------  len_squared
    // the square of the length
    
    
    func len_squared() -> Double
    {
    return (x * x + y * y + z * z);
    }
    
    // ----------------------------------------------------------- assignment operator
    // assign a Normal to a vector
    
    init (let rhs:Normal)
    {
    x = rhs.x; y = rhs.y; z = rhs.z;
    
    }
    
    
    // ---------------------------------------------------------- assignment operator
    // assign a point to a vector
    
    init (let rhs:Point3D) {
    x = rhs.x; y = rhs.y; z = rhs.z;
    }

    
 
    
}

// multiplication by a matrix on the left
func *(mat: Matrix, v: Vector3D) -> Vector3D
{
    var expression1 = mat.m[0][0] * v.x
    expression1 += mat.m[0][1] * v.y
    expression1 += mat.m[0][2] * v.z
    var expression2 = mat.m[1][0] * v.x
    expression2 += mat.m[1][1] * v.y
    expression2 += mat.m[1][2] * v.z
    var expression3 = mat.m[2][0] * v.x
    expression3 += mat.m[2][1] * v.y
    expression3 += mat.m[2][2] * v.z
    

    return(Vector3D(_x: expression1, _y: expression2, _z: expression3))
}
