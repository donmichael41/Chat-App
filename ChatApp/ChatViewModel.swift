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
    var messages = [JSQMessage]()
    var delegate: ChatViewController!
    
    init () {
        setup()
    }
    func setup() {
        
    }
}

extension ChatViewModel {
    
    func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            delegate.messages.append(message)
            DispatchQueue.main.async {
                self.delegate.collectionView.reloadData()
            }
            
        }
    }
    func addFeedBackMessages(withId id: String, name: String, text: String) {
        
        let sender = name
        let messageContent = text
        addMessage(withId: sender, name: sender, text: messageContent)
    }
}
