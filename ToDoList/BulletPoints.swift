//
//  BulletPoints.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 22.09.2021.
//

import UIKit

@IBDesignable
class DrawCircles: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get graphics context")
            return
        }

        context.setLineWidth(2)

        context.setStrokeColor(UIColor.red.cgColor)

        context.addEllipse(in: CGRect(x: 30, y: 30, width: 5.0, height: 5.0))

        context.strokePath()
    }
}
