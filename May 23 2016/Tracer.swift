//
//  Tracer.swift
//  MatrixTest
//
//  Created by Student on 2016-05-16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class Tracer {
    var w: World?
    init() {
        w = nil
    }
    init(worldptr: World?)
    {
        w = worldptr
    }
    
    func trace_ray(ray: Ray) -> RGBColor {
        return (black)
    }
    func trace_ray(ray: Ray, depth: Int) -> RGBColor {
        return (black)
    }
}