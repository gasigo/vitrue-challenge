//
//  SceneDelegate.swift
//  Vitrue Test
//
//  Created by Gabriel Gomes on 10/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)
		let interactor = PalindromeCheckInteractor()
		window.rootViewController = PalindromeCheckViewController(interactor: interactor)
		window.makeKeyAndVisible()
		self.window = window
	}
}

