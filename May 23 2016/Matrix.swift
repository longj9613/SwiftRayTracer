//
//  main.swift
//  MatrixTest
//
//  Created by Student on 2016-04-26.
//  Copyright © 2016 Student. All rights reserved.
//


import Foundation

func *(let lhs:Matrix,let rhs:Matrix) -> Matrix {
    let product = Matrix()
    
    print(product)
    
    for y in 0..<4
    {
        for x in 0..<4
        {
            var sum = 0.0
            for j in 0..<4
            {
                sum += lhs.m[x][j] * rhs.m[j][y]
            }
            product.m[x][y] = sum
        }
    }
    return product
}

func /(let lhs:Matrix,let rhs: Double) {
    for x in 0..<4
    {
        for y in 0..<4
        {
            lhs.m[x][y] = lhs.m[x][y]/rhs
        }
    }
}

class Matrix {
    
    var m = Array(count: 4, repeatedValue: Array(count: 4, repeatedValue: 0.0))
    
    init()
    {
        for x in 0..<4
        {
            for y in 0..<4
            {
                if x==y
                {
                    m[x][y] = 1.0
                }
            }
        }
    }
    
    init(mat: Matrix)
    {
        for x in 0..<4
        {
            for y in 0..<4
            {
                m[x][y] = mat.m[x][y]
            }
        }
    }
    
    func setIdentity() {
        for x in 0..<4
        {
            for y in 0..<4
            {
                if (x==y)
                {
                    m[x][y] = 1.0
                }
                else
                {
                    m[x][y] = 0.0
                }
            }
        }
    }
}