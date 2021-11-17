//
//  ChatViewController.swift
//  Messengar1
//
//  Created by administrator on 03/11/2021.
//


import UIKit
import MessageKit

import InputBarAccessoryView
struct Sender: SenderType{
    var displayName: String
    
    var photoURL: String
    var senderId: String
    
}
struct Message: MessageType{
    var sender: SenderType
    var messageId: String //Here Mariam (message id)
    var sentDate: Date
    var kind: MessageKind // Message type, text, video or anything else
    
}
class ChatViewController: MessagesViewController , MessagesDataSource , MessagesLayoutDelegate , MessagesDisplayDelegate{
    let User = Sender(displayName: "DA___!! ", photoURL: "1", senderId: "self") //  sides of the messages
    //side first
    let User2 = Sender(displayName: "Mariam", photoURL: "2", senderId: "others") // //  sides of the messages
    //side S2
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
messages.append(Message(sender: User,      //the message sent first message
                        messageId: "1",
                        sentDate: Date().addingTimeInterval(-86400),
                        kind: .text("Hello")))
        
messages.append(Message(sender: User2,      //the message sent S2
                        messageId: "2",
                                sentDate: Date().addingTimeInterval(-71000),
                                kind: .text("Hi")))
        
messages.append(Message(sender: User,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-61050),
                                kind: .text("Is everything okay?")))
        //the message received
        messages.append(Message(sender: User2,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-41000),
                                    kind: .text("I think so don't worry")))
messages.append(Message(sender: User,
                                messageId: "5",
                                sentDate: Date().addingTimeInterval(-21000),
                                kind: .text("  good  bye ")))
                                                        
        messages.append(Message(sender: User2, // last message
                                messageId: "6",
                                sentDate: Date().addingTimeInterval(-11000),
                                kind: .text("  good  bye ")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    func currentSender() -> SenderType {
        return User     }
    
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        //section is to determine which side messages be
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        // The number of messages, Mariam
        return messages.count     }
    
}


    
    
    
    

