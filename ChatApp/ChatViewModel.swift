//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Hung Nguyen on 12/11/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import JSQMessagesViewController

class ChatViewModel {
    
    private let disposeBag = DisposeBag()
    
    var user = BehaviorSubject(value: "")
    
    var delegate: ChatViewController!
    
    init () {
        
        setup()
    }
    func setup() {
        // For set up RX
    }
}

extension ChatViewModel {
    
    func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            self.delegate.messages.append(message)
            
            DispatchQueue.main.async {
                self.delegate.finishReceivingMessage()
                self.delegate.collectionView.reloadData()
            }
        }
        
        addFeedBackMessages(name: name, text: text)
    }
    
    func addFeedBackMessages(name: String, text: String) {

        let ramdom = String(arc4random())
        DispatchQueue.global().async {
            sleep(2)
            if let message = JSQMessage(senderId: ramdom, displayName: "Friend in \(ramdom) say:", text: "hi: \(text)")  {
                self.delegate.messages.append(message)
                DispatchQueue.main.async {
                    self.delegate.finishReceivingMessage()
                    self.delegate.collectionView.reloadData()
                }
            }

        }
    }
}
