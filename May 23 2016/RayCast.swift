//
//  RayCast.swift
//  MatrixTest
//
//  Created by Student on 2016-05-19.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class RayCast: Tracer {
    
    override init()
    {
        super.init()
    }
    
    override init(worldptr: World?)
    {
        super.init(worldptr: worldptr)
    }
    
    override func trace_ray(ray: Ray) -> RGBColor {
        var sr: ShadeRec = w!.hit_objects(ray)
        
        if (sr.hit_an_object)
        {
            sr.ray = ray
            return (sr.material.shade(sr))
        }
        else
        {
            return (w?.background_color)!
        }
    }
    
    override func trace_ray(ray: Ray, depth: Int) -> RGBColor {
        var sr: ShadeRec = w!.hit_objects(ray)
        
        if (sr.hit_an_object)
        {
            sr.ray = ray
            return (sr.material.shade(sr))
        }
        else
        {
            return (w?.background_color)!
        }
    }
}