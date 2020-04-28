//
//  KeyboardViewController+Setup.swift
//  KeyboardKitDemoKeyboard
//
//  Created by Daniel Saidi on 2019-10-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import UIKit

extension KeyboardViewController {
    
    func setupKeyboard() {
        setupKeyboard(for: view.bounds.size)
    }
    
    func setupKeyboard(for size: CGSize) {
        DispatchQueue.main.async {
            self.setupKeyboardAsync(for: size)
        }
    }
    
    func setupKeyboardAsync(for size: CGSize) {
        keyboardStackView.removeAllArrangedSubviews()
        switch keyboardType {
        case .alphabetic(let uppercased): setupAlphabeticKeyboard(uppercased: uppercased)
        case .numeric: setupNumericKeyboard()
        case .symbolic: setupSymbolicKeyboard()
        case .custom(_): setupTokenKeyboard()
        default: return
        }
    }
    
    func setupAlphabeticKeyboard(uppercased: Bool = false) {
        let keyboard = AlphabeticKeyboard(uppercased: uppercased, in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        let top = topButtonRow(for: keyboard.topActions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubview(top)
        keyboardStackView.addArrangedSubviews(rows)
    }
    
    func setupNumericKeyboard() {
        let keyboard = NumericKeyboard(in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        let top = topButtonRow(for: keyboard.topActions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubview(top)
        keyboardStackView.addArrangedSubviews(rows)
    }
    
    func setupSymbolicKeyboard() {
        let keyboard = SymbolicKeyboard(in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        let top = topButtonRow(for: keyboard.topActions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubview(top)
        keyboardStackView.addArrangedSubviews(rows)
    }
    
    func setupTokenKeyboard() {
        let tokenView = TokenKeyboardView.fromNib(owner: self)
        tokenView.frame = CGRect(x: 0, y: 0, width: 320, height: 160)
        tokenView.setupBackButton(keyboardInputController: self)
        keyboardStackView.addArrangedSubview(tokenView)
    }
}
