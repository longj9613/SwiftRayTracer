//
//  World.swift
//  MatrixTest
//
//  Created by Student on 2016-05-16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class World {
    var vp: ViewPlane
    var background_color: RGBColor
    var tracer_ptr: Tracer? //replacing ptrs with optionals
    var ambient_ptr: Light?
    var camera_ptr: Camera?
    var sphere: Sphere
    var objects: [GeometricObject] //array of geometric objects
    var lights: [Light]
    
    var paintArea: RenderThread?    //originally a pointer to wxRaytracer.h
    
    init()
    {
        background_color = black
        tracer_ptr = nil
        ambient_ptr = //maybe an array? fixme
        camera_ptr = nil
    }
    
    func render_scene()
    {
        var pixel_color: RGBColor
        var ray: Ray
        var hres: Int = vp.hres
        var vres: Int = vp.vres
        var s: Float = vp.s
        var zw: Float = 100.0
        
        ray.d = Vector3D(_x: 0,_y: 0,_z: -1)
        
        for r in 0..<vres
        {
            for c in 0...hres
            {
                ray.o = Point3D(Double(s)*(Double(c) - Double(hres) / 2.0 + 5.0),
                        Double(s) * (Double(r) - Double(vres) / 2.0 + 0.5), zw)
                pixel_color = (tracer_ptr?.trace_ray(ray))!
                display_pixel(r, column: c, raw_color: pixel_color)
            }
        }
    }
    
    func max_to_one(c: RGBColor) -> RGBColor
    {
        var max_value: Float = max(c.r, max(c.g,c.b))
        
        if (max_value > 1.0)
        {
            return c/max_value
        }
        else
        {
            return c
        }
    }
    
    func clamp_to_color(raw_color: RGBColor) -> RGBColor
    {
        var c: RGBColor = raw_color
        
        if ((raw_color.r > 1.0) || (raw_color.g > 1.0) || (raw_color.b > 1.0))
        {
            c.r = 1.0
            c.g = 0.0
            c.b = 0.0
        }
        
        return c
    }
    
    // ---------------------------------------------------------------------------display_pixel
    // raw_color is the pixel color computed by the ray tracer
    // its RGB floating point components can be arbitrarily large
    // mapped_color has all components in the range [0, 1], but still floating point
    // display color has integer components for computer display
    // the Mac's components are in the range [0, 65535]
    // a PC's components will probably be in the range [0, 255]
    // the system-dependent code is in the function convert_to_display_color
    // the function SetCPixel is a Mac OS function
    
    func display_pixel(row: Int, column: Int, raw_color: RGBColor)
    {
        var mapped_color: RGBColor
        
        if (vp.show_out_of_gamut)
        {
            mapped_color = clamp_to_color(raw_color)
        }
        else
        {
            mapped_color = max_to_one(raw_color)
        }
        
        if (vp.gamma != 1.0)
        {
            mapped_color = mapped_color.powc(vp.inv_gamma)
        }
        
        var x: Int = column
        var y: Int = vp.vres - row - 1
        
        paintArea.setPixel(x,y, Int(mapped_color.r * 255), Int(mapped_color.g * 255),
                                Int(mapped_color.b * 255))
    }
    
    func hit_objects(ray: Ray) -> ShadeRec
    {
        var sr: ShadeRec
        var t: Double
        var normal: Normal
        var local_hit_point: Point3D
        var tmin:Float = Float(kHugeValue)
        var num_objects: Int = objects.size()
        
        for j in 0..<num_objects
        {
            if (objects[j].hit(ray, t, sr) && (t < tmin))
            {
                sr.hit_an_object = true
                tmin = Float(t)
                sr.material = objects[j].get_material()
                sr.hit_point = ray.o + t * ray.d
                normal = sr.normal
                local_hit_point = sr.local_hit_point
            }
        }
        
        if (sr.hit_an_object)
        {
            sr.t = Double(tmin)
            sr.normal = normal
            sr.local_hit_point = local_hit_point
        }
        
        return(sr)
    }
    
    //Deletes objects in the objects array
    func delete_objects()
    {
        objects.removeAll()
    }
    
    func delete_lights()
    {
        lights.removeAll()
    }
    
    func add_object(object_ptr: GeometricObject)
    {
        objects.append(object_ptr)
    }
    
    func add_light(light_ptr: Light)
    {
        lights.append(light_ptr)
    }
    
    func set_ambient_light(light_ptr: Light)
    {
        ambient_ptr = light_ptr
    }
    
    func set_camera(c_ptr: Camera)
    {
        camera_ptr = c_ptr
    }
}





