//
//  Client.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/21.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

let initialLetters = ["A","B","C","D","E","F","G",
                      "H","I","J","K","L","M","N",
                      "O","P","Q","R","S","T","U",
                      "V","W","X","Y","Z"]


class Client: Object {
    dynamic var name = ""
    dynamic var firstLetter = ""
    
    convenience init(name:String,firstLetter:String) {
        self.init()
        self.name = name
        self.firstLetter = firstLetter
    }
}

struct ClientSection {
    var sectionTitles = [String]()
    var clients = [Results<Client>]()
    
    
    func titleForHeaderSection(section:Int) -> String {
        return sectionTitles[section]
    }
    func sectionCount() -> Int {
        return self.sectionTitles.count
    }
    func numberOfRowsInSection(section:Int) -> Int {
        let results = clients[section]
        return results.count
    }
    func clientForIndexPath(indexPath:NSIndexPath) -> Client {
        let results = clients[indexPath.section]
        return results[indexPath.row]
    }
}

//MARK:Helper
func addTestClients() {
    
    let realm = try!Realm()
    for letter in initialLetters {
        for index in 1...5 {
            let client = Client(name: "\(letter)-\(index)", firstLetter: letter)
            try! realm.write({ 
                realm.add(client)
            })
        }
    }
    print(Realm.Configuration.defaultConfiguration.path!)
}

func clientsWithInitLetter() -> ClientSection{
    
    var clientSection = ClientSection()
    
    let realm = try!Realm()
    for letter in initialLetters {
        let searchedClients = realm.objects(Client).filter("firstLetter = '\(letter)'").sorted("firstLetter")
        if searchedClients.count > 0 {
            let firstClient = searchedClients.first!
            clientSection.sectionTitles.append(firstClient.firstLetter)
            clientSection.clients.append(searchedClients)
        }
    }
    return clientSection
}

