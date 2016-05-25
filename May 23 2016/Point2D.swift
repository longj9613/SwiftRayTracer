//
//  Point2D.swift
//  RGBColor
//
//  Created by Surien on 2016-04-26.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation

// scales the point by the float a

func *(lhs:Point2D, rhs:Double) -> Point2D {
    return (Point2D(x1: rhs * lhs.x, y1: rhs * lhs.y));
}


class Point2D
{
    var x:Double
    var y:Double
    
    
    init ()
    {
        x=0.0; y=0.0;
    }
    
    init(let arg:Double)
    {
        x=arg; y=arg;
    }
    
    init(let x1:Double, let y1:Double)
    {
        x = x1; y = y1;
    
    }
    
    init(let p:Point2D)
    {
        x = p.x; y = p.y;
    }
    
    
}