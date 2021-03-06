//
//  StorageManager.swift
//  SwiftChat
//
//  Created by Mikhail on 23.04.2021.
//

import RealmSwift

let localRealm = try! Realm()

class StorageManager {
    
    static func saveChat(_ chat: ChatModel) {
        try! localRealm.write {
            localRealm.add(chat)
        }
    }
    
    static func saveMessage(_ chat: ChatModel, message: MessagesModel) {
        try! localRealm.write {
            chat.messages.append(message)
        }
    }
    
    static func deleteChat(_ chat: ChatModel) {
        try! localRealm.write {
            let messages = chat.messages
            localRealm.delete(messages)
            localRealm.delete(chat)
        }
    }
    
    static func editChat(_ chat: ChatModel, newChatTitle: MessagesModel) {
        try! localRealm.write {
            chat.titleChat = newChatTitle.titleMessage
            chat.timeChat = newChatTitle.timeMessage
        }
    }
}
