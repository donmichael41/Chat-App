//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Hung Nguyen on 12/11/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    let disposeBag = DisposeBag()

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loginButton.isEnabled = false
    }
    
    
    func setup() {
        let validateUser = self.usernameTextField.rx.text
            .map {
                ($0?.characters.count)! > 5
            }
            .distinctUntilChanged()
        
        _ = validateUser
            .subscribe(onNext: { value in
                print(value)
            })
            .addDisposableTo(disposeBag)
        
        validateUser
            .map {
                $0 ? UIColor.green : UIColor.white
            }
            .subscribe(onNext: {
                self.usernameTextField.backgroundColor = $0
            })
            .addDisposableTo(disposeBag)
        
        validateUser.bindTo(loginButton.rx.isEnabled)
        .addDisposableTo(disposeBag)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChat" {
            if let chatViewController = segue.destination as? ChatViewController {
                chatViewController.senderId = usernameTextField.text
                chatViewController.senderDisplayName = usernameTextField.text
            }
        }
    }
}
