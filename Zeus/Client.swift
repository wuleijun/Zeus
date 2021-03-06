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
    
    override class func primaryKey()->String? {
        return "name"
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
                //只有含有主键primaryKey的对象，才可以传update，
                realm.add(client,update: true)
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

func clientsWith(searchText text:String) -> Results<Client> {
    let realm = try!Realm()
    let searchedClients = realm.objects(Client).filter("name CONTAINS '\(text)'").sorted("firstLetter")
    return searchedClients
}
