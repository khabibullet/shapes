//
//  CircleView.swift
//  gestures
//
//  Created by Alebelly Nemesis on 8/20/22.
//

import UIKit

final class Circle: Shape {

	var	centerPoint : CGPoint {
		return CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
	override func draw(_ rect: CGRect) {
		let path = UIBezierPath()
		path.move(to: centerPoint)
		path.addArc(withCenter: centerPoint, radius: rect.width / 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
		color.set()
		path.fill()
	}
}
