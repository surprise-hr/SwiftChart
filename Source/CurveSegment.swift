//
//  CurveSegment.swift
//  SwiftChart
//
//  Created by Serhii Kostanian on 25.03.2021.
//

import Foundation

struct CurveSegment {
    let startPoint: CGPoint
    let cp1: CGPoint
    let cp2: CGPoint
    let endPoint: CGPoint

    /// Calculates a point at given normalized offset value in 0.0...1.0.
    /// Uses De Casteljau's algorithm.
    func point(atOffset t: CGFloat) -> CGPoint {
        let mt = 1 - t
        let mt2 = mt * mt
        let t2 = t * t

        let a = mt2 * mt
        let b = mt2 * t * 3
        let c = mt * t2 * 3
        let d = t * t2

        let x = a*startPoint.x + b*cp1.x + c*cp2.x + d*endPoint.x
        let y = a*startPoint.y + b*cp1.y + c*cp2.y + d*endPoint.y

        return CGPoint(x: x, y: y)
    }
}
