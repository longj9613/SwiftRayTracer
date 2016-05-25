//
//  Camera.swift
//  World Class
//
//  Created by Jordan Long on 2016-04-28.
//  Copyright © 2016 Jordan Long. All rights reserved.
//

import Foundation

class Camera {
    
    var eye: Point3D
    var lookat: Point3D
    var ra: Float
    var u: Vector3D
    var v: Vector3D
    var w: Vector3D
    var up: Vector3D
    var exposure_time: Float
    
    init()
    {
        eye = Point3D(a: 0, b: 0, c: 500)
        lookat = Point3D(a: 0)
        ra = 0
        u = Vector3D(_x: 1, _y: 0, _z: 0)
        v = Vector3D(_x: 0, _y: 1, _z: 0)
        w = Vector3D(_x: 0, _y: 0, _z: 1)
        up = Vector3D(_x: 0, _y: 1, _z: 0)
        exposure_time = 1.0
    }
    
    init(c: Camera)
    {
        eye = c.eye
        lookat = c.lookat
        ra = c.ra
        up = c.up
        u = c.u
        v = c.v
        w = c.w
        exposure_time = c.exposure_time
    }
    
    //virtual void
    //render_scene(const World& w) = 0;
    
    // ----------------------------------------------------------------- set_eye
    
    func set_eye(p: Point3D) {
        eye = p
    }
    
    
    // ----------------------------------------------------------------- set_eye
    
    func set_eye(x:Double, y: Double, z: Double) {
        eye.x = x
        eye.y = y
        eye.z = z
    }
    
    
    // ----------------------------------------------------------------- set_lookat
    
    func set_lookat(p: Point3D) {
        lookat = p
    }
    
    
    // ----------------------------------------------------------------- set_lookat
    
    func set_lookat(x: Double, y: Double, z: Double)
    {
        lookat.x = x
        lookat.y = y
        lookat.z = z
    }
    
    
    // ----------------------------------------------------------------- set_up_vector
    
    func set_up_vector(u: Vector3D)
    {
        up = u
    }
    
    
    // ----------------------------------------------------------------- set_up_vector
    
    func set_up_vector(x: Double, y: Double, z: Double)
    {
        up.x = x
        up.y = y
        up.z = z
    }
    
    
    // ----------------------------------------------------------------- set_roll
    
    func set_roll(r: Float)
    {
        ra = r
    }
    
    
    // ----------------------------------------------------------------- set_exposure_time
    
    func set_exposure_time(exposure: Float)
    {
        exposure_time = exposure
    }
    
    //-------------------------------------------------------------- compute_uvw
    
    // This computes an orthornormal basis given the view point, lookat point, and up vector
    
    func compute_uvw() {
        w = eye - lookat
        w.normalize()
        u = up ^ w
        u.normalize()
        v = w ^ u
    }
    
    // take care of the singularity by hardwiring in specific camera orientations
  /*  if ((eye.x == lookat.x) && (eye.z == lookat.z) && (eye.y > lookat.y)) { // camera looking vertically down
    u = Vector3D(0, 0, 1)
    v = Vector3D(1, 0, 0)
    w = Vector3D(0, 1, 0)
    }
    
    if (eye.x == lookat.x && eye.z == lookat.z && eye.y < lookat.y) { // camera looking vertically up
    u = Vector3D(1, 0, 0)
    v = Vector3D(0, 0, 1)
    w = Vector3D(0, -1, 0)
    }*/
}

