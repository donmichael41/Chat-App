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
    
    var messages = [JSQMessage]()

    var delegate: ChatViewController!
    
    init () {
        
        setup()
    }
    func setup() {
        // For set up RX
    }
}

extension ChatViewModel {
    
    func addMessage(withId id: String, name: String, text: String, completion:  @escaping(_ mesage: JSQMessage) -> Void ) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            self.messages.append(message)
            
            DispatchQueue.main.async {
                self.delegate.finishReceivingMessage()
                self.delegate.collectionView.reloadData()
            }
        }
        
        
        // Fake implement for completion
        
        let ramdom = String(arc4random())
        DispatchQueue.global().async {
            sleep(2)
            if let message = JSQMessage(senderId: ramdom, displayName: "Friend in \(ramdom) say:", text: "hi: \(text)")  {
                completion(message)
            }
            
        }
    }
    

}
