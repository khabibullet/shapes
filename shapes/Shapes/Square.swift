//
//  SquareView.swift
//  gestures
//
//  Created by Alebelly Nemesis on 8/20/22.
//

import UIKit

final class Square: Shape {

	var	centerPoint : CGPoint {
		return CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
	override func draw(_ rect: CGRect) {
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: 0))
		path.addLine(to: CGPoint(x: rect.width, y: 0))
		path.addLine(to: CGPoint(x: rect.width, y: rect.height))
		path.addLine(to: CGPoint(x: 0, y: rect.height))
		path.close()
		color.set()
		path.fill()
	}
}
