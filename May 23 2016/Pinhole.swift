 //
//  Pinhole.swift
//  RGBColor
//
//  Created by Surien on 2016-05-02.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation

 class pinHole: Camera
{
    
    var d:Double		// view plane distance
    var zoom:Float	// zoom factor
    
    
    // ----------------------------------------------------------------------------- default constructor
    
    override init()
    {
        d=500
        zoom=1.0
        super.init()
    }
    
    
    // ----------------------------------------------------------------------------- copy constructor
    
    init(c:pinHole)
    {
        d=c.d
        zoom=c.zoom
        super.init(c: c)
    }
    
    
    // ----------------------------------------------------------------------------- clone
    
    /*Camera*
    Pinhole::clone(void) const {
    return (new Pinhole(*this));
    }
    */
    
    
    
    // ----------------------------------------------------------------------------- get_direction
    
    func get_direction(p:Point2D) ->Vector3D
    {
        var dir:Vector3D = p.x * u + p.y * v - d * w
        dir.normalize()
    
        return(dir)
    }
    
    
    
    // ----------------------------------------------------------------------------- render_scene
    // not sure how having two varibles called double works
    
func render_scene(w:World) {
    
    var L:RGBColor
    var vp:ViewPlane = w.vp
    var ray:Ray
    var depth = 0
    var pp:Point2D		// sample point on a pixel
    var n:Int = (Int)(sqrt((Float)(vp.num_samples)))
    
    vp.s /= zoom
    ray.o = eye
    
    for r in 0..<vp.vres
    {// up
        for c in 0..<vp.hres
        {		// across
            L = black
    
            for p in 0..<n
            {// up pixel
        
                for q in 0..<n
                {	// across pixel
                    let temp1a = (Double(q) + 0.5) / Double(n)
                    let temp1 = (Double(c) - 0.5 * Double(vp.hres) + temp1a)
                    pp.x = Double(vp.s) * temp1
                    let temp2 = (Double(r) - 0.5 * Double(vp.vres) + (Double(p) + 0.5) / Double(n))
                    pp.y = Double(vp.s) * temp2
                    ray.d = get_direction(pp)
                    //what does this do?
                    L += w.tracer_ptr!.trace_ray(ray, depth: depth)
                }
    
                L /= Float(vp.num_samples)
                L *= exposure_time
                w.display_pixel(r, column: c, raw_color: L)
            }
        }
    }
    }
}

