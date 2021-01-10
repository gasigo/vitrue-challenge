//
//  PermutationCheckViewController.swift
//  Vitrue Test
//
//  Created by Gabriel Gomes on 10/01/2021.
//

import Combine
import UIKit

final class PalindromeCheckViewController: UIViewController {
	private let interactor: PalindromeCheckInteractor

	private var cancellable: AnyCancellable?
	@IBOutlet private weak var inputTextField: UITextField!
	@IBOutlet private weak var outputLabel: UILabel!

	init(interactor: PalindromeCheckInteractor) {
		self.interactor = interactor
		super.init(nibName: "PalindromeCheckViewController", bundle: .main)
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	deinit {
		cancellable?.cancel()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		cancellable = interactor.$state.sink { [weak self] state in
			DispatchQueue.main.async {
				self?.outputLabel.text = state.isPalindrome.description
			}
		}
	}
	@IBAction func editingDidChange(_ sender: Any) {
		guard let input = inputTextField.text else { return }
		interactor.checkIfStringCanBePalindrome(input: input)
	}
}
