//
//  MultipleObjects.swift
//  MatrixTest
//
//  Created by Student on 2016-05-19.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class MultipleObjects: Tracer
{
    override init()
    {
        super.init()
    }
    override init(worldptr: World?)
    {
        super.init(worldptr: worldptr)
    }
    override func trace_ray(ray: Ray) -> RGBColor
    {
        var sr: ShadeRec
    }
}