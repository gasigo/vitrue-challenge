//
//  PalindromeCheckInteractor.swift
//  Vitrue Test
//
//  Created by Gabriel Gomes on 10/01/2021.
//

import Combine

final class PalindromeCheckInteractor {
	@Published private(set) var state: State = State(isPalindrome: false)

	func checkIfStringCanBePalindrome(input: String) {
		guard !input.isEmpty else { return }

		let characters = Array(input.replacingOccurrences(of: " ", with: "").lowercased())
		let characterGroups = Dictionary(grouping: characters, by: { $0 })
		let characterSet = Set(characters)

		var oddCounter = 0
		for character in characterSet {
			guard let count = characterGroups[character]?.count, oddCounter <= 1 else {
				break
			}

			if !count.isMultiple(of: 2) {
				oddCounter += 1
			}
		}

		if oddCounter > 1 { // Can't be a palindrome
			state = State(isPalindrome: false)
		} else { // Can be a palindrome
			state = State(isPalindrome: true)
		}
	}
}

extension PalindromeCheckInteractor {
	struct State {
		let isPalindrome: Bool
	}
}
