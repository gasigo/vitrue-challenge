//
//  PalindromeCheckInteractorTests.swift
//  Vitrue TestTests
//
//  Created by Gabriel Gomes on 10/01/2021.
//

@testable import Vitrue_Test
import XCTest

final class PalindromeCheckInteractorTests: XCTestCase {
	private let sut = PalindromeCheckInteractor()

	func testCheckIfStringCanBePalindrome_givenInputIsAPalindromeString_thenStateIsPalindrome() {
		// given
		let input = "Pot spot"

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, true)
	}

	func testCheckIfStringCanBePalindrome_givenInputIsANonPalindromeString_thenStateIsNotPalindrome() {
		// given
		let input = "Banana"

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, false)
	}

	func testCheckIfStringCanBePalindrome_givenInputIsABigPalindromeString_thenStateIsPalindrome() {
		// given
		let input = "aaaabbccccddeeeeffgggghhiiiijjaaaabbccccddeeeeffgggghhiiiijjaaaabbccccddeeeeffgggghhiiiijjz"

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, true)
	}

	func testCheckIfStringCanBePalindrome_givenInputIsABigNonPalindromeString_thenStateIsNotPalindrome() {
		// given
		let input = "aaaaabbccccddeeeeffgggghhiiiijjaaaabbccccddeeeeffgggghhiiiijjaaaabbccccddeeeeffgggghhiiiijjz"

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, false)
	}

	func testCheckIfStringCanBePalindrome_givenInputIsOneChar_thenStateIsPalindrome() {
		// given
		let input = "a"

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, true)
	}

	func testCheckIfStringCanBePalindrome_givenInputIsEmpty_thenStateIsNotPalindrome() {
		// given
		let input = ""

		// when
		sut.checkIfStringCanBePalindrome(input: input)

		// then
		XCTAssertEqual(sut.state.isPalindrome, false)
	}
}
