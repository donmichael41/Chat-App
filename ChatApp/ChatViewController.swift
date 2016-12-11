//
//  ViewController.swift
//  ChatApp
//
//  Created by Hung Nguyen on 12/7/16.
//  Copyright © 2016 Hung Nguyen. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import RxSwift

class ChatViewController: JSQMessagesViewController {
 
    var messages: [JSQMessage]!

    let disposeBag = DisposeBag()
    var chatViewModel: ChatViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatViewModel = ChatViewModel()
        chatViewModel.delegate = self
        messages = chatViewModel.messages
        
        setUpRx()
    }
    var user = BehaviorSubject(value: "")
    func setUpRx() {
        user.distinctUntilChanged()
            .subscribe(onNext: { username in
                self.senderId = username
                self.senderDisplayName = username
                print(username)
            })
            .addDisposableTo(disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupIncomingBubble()
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item] // 1
        if message.senderId == senderId { // 2
            return outgoingBubbleImageView
        } else { // 3
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 15
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView?, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString? {
        let message = messages[indexPath.item]
        switch message.senderId {
        case senderId:
            return nil
        default:
            guard let senderDisplayName = message.senderDisplayName else {
                assertionFailure()
                return nil
            }
            return NSAttributedString(string: senderDisplayName)
        }
    }
    
    override func didPressAccessoryButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            picker.sourceType = UIImagePickerControllerSourceType.camera
        } else {
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        }
        
        present(picker, animated: true, completion:nil)
    }
    
    // Two help method to config color of in and come mess
    private func setupOutgoingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }
    
    private func setupIncomingBubble() -> JSQMessagesBubbleImage {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        return bubbleImageFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }

    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        chatViewModel.addMessage(withId: self.senderId, name: self.senderDisplayName, text: text)
        
        let ramdom = String(arc4random())
        DispatchQueue.global().async {
            sleep(2)
            self.chatViewModel.addFeedBackMessages(withId: ramdom, name: "Friend of \(ramdom) say:", text: "Back: \(text!)")
            DispatchQueue.main.async {
                self.finishReceivingMessage()
            }
        }
        
        finishSendingMessage()
    }
    
    

}

extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}


