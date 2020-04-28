//
//  KeyboardComponent.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Keyboard stack view components are "rows" that can be added
 to your `KeyboardInputViewController`'s `keyboardStackView`.
 
 A few examples of such components are button rows, toolbars,
 auto-complete suggestion bars etc.
 */
public protocol KeyboardStackViewComponent: VerticalKeyboardComponent {}
