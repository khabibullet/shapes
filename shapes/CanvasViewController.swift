//
//  ViewController.swift
//  gestures
//
//  Created by Alebelly Nemesis on 8/20/22.
//

import UIKit

class CanvasViewController: UIViewController {
	
	var animator: UIDynamicAnimator?
	let gravity = UIGravityBehavior(items: [])
	let collision = UICollisionBehavior(items: [])

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white
		setupViewGestures()
		addDinamicAnimation()
	}
}

extension CanvasViewController {
	
	func setupViewGestures() {
		let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
		gesture.numberOfTapsRequired = 1
		view.addGestureRecognizer(gesture)
	}
	
	@objc func didTap(gesture: UITapGestureRecognizer) {
		let center = gesture.location(in: view)
		let size = CGSize(width: 100, height: 100)
		if arc4random_uniform(2) == 0 {
			let square = Square(frame: CGRect(origin: center, size: size))
			view.addSubview(square)
			gravity.addItem(square)
			collision.addItem(square)
		} else {
			let circle = Circle(frame: CGRect(origin: center, size: size))
			view.addSubview(circle)
			gravity.addItem(circle)
			collision.addItem(circle)
		}
	}
}

extension CanvasViewController {
	
	func addDinamicAnimation() {
		animator = UIDynamicAnimator(referenceView: view)
		
		gravity.magnitude = 2.0
		animator?.addBehavior(gravity)
		
		collision.translatesReferenceBoundsIntoBoundary = true
		animator?.addBehavior(collision)
	}
}

extension UIColor {
	static var random: UIColor {
		return UIColor(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1), alpha: 1
		)
	}
}
