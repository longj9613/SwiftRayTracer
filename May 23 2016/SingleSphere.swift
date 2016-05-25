//
//  SingleSphere.swift
//  MatrixTest
//
//  Created by Student on 2016-05-16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class SingleSphere: Tracer {
    override init()
    {
        super.init()
    }
    
    override init(worldptr: World?)
    {
        super.init(worldptr: worldptr)
    }
    
    override func trace_ray(ray: Ray) -> RGBColor {
        var sr: ShadeRec = ShadeRec(wr: w!)
        var t:Double
        
        if (w.sphere.hit(ray, t, sr)) {
            return(red)
        }
        else {
            return(black)
        }
    }
}