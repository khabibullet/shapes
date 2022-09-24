//
//  SceneDelegate.swift
//  gestures
//
//  Created by Alebelly Nemesis on 8/20/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		self.window = window
		
		let rootVC = CanvasViewController()
		window.rootViewController = rootVC
		window.makeKeyAndVisible()
	}
}
