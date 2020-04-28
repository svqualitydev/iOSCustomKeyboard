//
//  TopButton.swift
//  MyKeyboard
//
//  Created by Admin on 2/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import KeyboardKit

class TopButton: KeyboardButtonView {
    @IBOutlet weak var button: UIButton!
    
    public func setup(with action: KeyboardAction, in viewController: KeyboardInputViewController, distribution: UIStackView.Distribution = .fillEqually) {
        super.setup(with: action, in: viewController)
        backgroundColor = .clearTappable
        button.setImage(action.buttonImage, for: .normal)
        button.setTitle(action.buttonText, for: .normal)
        width = action.buttonWidth(for: distribution)
    }
}


// MARK: - Private button-specific KeyboardAction Extensions

private extension KeyboardAction {
    var buttonImage: UIImage? {
        var buttonName = ""
        
        switch self {
        case .custom(let name):
           buttonName = name
        default:
            break
        }
        
        switch buttonName {
        case CustomButtonName.payments.rawValue:
            return Asset.Images.TopButtons.payments.image
        case CustomButtonName.templates.rawValue:
            return Asset.Images.TopButtons.templates.image
        case CustomButtonName.scheduling.rawValue:
            return Asset.Images.TopButtons.scheduling.image
        default:
            return nil
        }
    }
    
    var buttonText: String? {
        var buttonName = ""
        
        switch self {
        case .custom(let name):
           buttonName = name
        default:
            break
        }
        
        switch buttonName {
        case CustomButtonName.payments.rawValue:
            return "Payments"
        case CustomButtonName.templates.rawValue:
            return "Templates"
        case CustomButtonName.scheduling.rawValue:
            return "Scheduling"
        default:
            return ""
        }
    }
    
    var buttonWidth: CGFloat {
        switch self {
        default: return 50
        }
    }
    
    func buttonWidth(for distribution: UIStackView.Distribution) -> CGFloat {
        let adjust = distribution == .fillProportionally
        return adjust ? buttonWidth * 100 : buttonWidth
    }
}
