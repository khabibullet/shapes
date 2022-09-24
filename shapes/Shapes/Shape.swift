//
//  Shape.swift
//  gestures
//
//  Created by Alebelly Nemesis on 8/20/22.
//

import UIKit

class Shape: UIView {
	
	private var offset: CGPoint?
	private var previousScale: CGFloat?
	let color = UIColor.random

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	func setup () {
		backgroundColor = .clear
		isOpaque = true
		contentMode = .redraw
		frame.origin.x -= frame.size.width / 2
		frame.origin.y -= frame.size.height / 2
		addGestures()
	}

	func addGestures() {
		addDragGesture()
		addPinchGesture()
		addRotationGesture()
	}
	
	func addDragGesture() {
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(gesture:)))
		addGestureRecognizer(panGesture)
	}
	
	@objc func didPan(gesture: UIPanGestureRecognizer) {
		guard let superview = self.superview else { return }
		let anchorPoint = gesture.location(in: superview)
		if gesture.state == .began {
			self.offset = CGPoint(x: center.x - anchorPoint.x, y: center.y - anchorPoint.y)
		} else {
			let newCenter = CGPoint(x: anchorPoint.x + (offset?.x ?? 0), y: anchorPoint.y + (offset?.y ?? 0))
			self.center = newCenter
		}
	}
	
	func addPinchGesture() {
		let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(gesture:)))
		addGestureRecognizer(pinchGesture)
	}
	
	@objc func didPinch(gesture: UIPinchGestureRecognizer) {
		switch gesture.state {
		case .began:
			previousScale = gesture.scale
		default:
			let scale = gesture.scale - (previousScale ?? 1.0)
			let newWidth = bounds.size.width * (1 + scale)
			let newHeight = bounds.size.height * (1 + scale)
			let offset = CGPoint(x: bounds.size.width - newWidth, y: bounds.size.height - newHeight)
			let newSize = CGSize(width: newWidth, height: newHeight)
			let newOrigin = CGPoint(x: frame.origin.x + offset.x / 2, y: frame.origin.y + offset.y / 2)
			frame = CGRect(origin: newOrigin, size: newSize)
			previousScale = gesture.scale
		}
	}
	
	func addRotationGesture() {
		let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRotate(gesture:)))
		addGestureRecognizer(rotationGesture)
	}
	
	@objc func didRotate(gesture: UIRotationGestureRecognizer) {
		if let view = gesture.view {
			view.transform = view.transform.rotated(by: gesture.rotation)
			gesture.rotation = 0
		}
	}
}
