//
//  TokenKeyboard.swift
//  MyKeyboard
//
//  Created by Admin on 2/28/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import KeyboardKit

class TokenKeyboardView: UIView {

    @IBOutlet weak var backButtonContainerView: UIView!
    @IBOutlet weak var tokenLabel: UILabel!
    var backButton: KeyboardButtonView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backButton = BackButton.fromNib(owner: self)
        backButton.frame = backButtonContainerView.bounds
        backButtonContainerView.addSubview(backButton)
        
        getToken()
    }
    
    func setupBackButton(keyboardInputController: KeyboardViewController) {
        self.backButton.setup(with: .custom(name: CustomButtonName.back.rawValue), in: keyboardInputController)
    }
    
    func getToken() {
        let endpoint = "https://api.agendafacil.app/auth/getToken"
        guard let url = URL(string: endpoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] (data, res, err) in

            guard let data = data else {
                  return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                    self?.showToken(token: json["token"])
                }
            } catch {
                print("didnt work")
            }

        }.resume()
    }
    
    func showToken(token: String?) {
        DispatchQueue.main.async {
            self.tokenLabel.text = token
        }
    }
}
