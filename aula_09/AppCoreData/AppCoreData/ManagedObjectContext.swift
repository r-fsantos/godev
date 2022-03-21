//
//  ManageObjectContext.swift
//  AppCoreData
//
//  Created by Renato F. dos Santos Jr on 17/03/22.
//

import UIKit
import CoreData
import Foundation

typealias onComletionHandler = (String) -> Void

protocol managedProtocol {
    func getPersons() -> [Person]
}

protocol managedSaveProtocol {
    func save(person: Person,
              onCompletionHandler: onComletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String,
onCompletionHandler: onComletionHandler)
}

class ManagedObjectContext: managedProtocol, managedSaveProtocol,                            managedDeleteProtocol {
    
    private let entity = "Users"
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.persistentContainer.viewContext
    }
        
    func getPersons() -> [Person] {
        var listPersons: [Person] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPersons }
            
            for item in persons {
                if let id = item.value(forKey: "id") as? UUID,
                   let name = item.value(forKey: "name") as? String,
                   let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    listPersons.append(person)
                }
            }
            
        } catch let error as NSError {
            print("Error in request \(error.localizedDescription)")
        }
        
        return listPersons
    }
    
    func save(person: Person, onCompletionHandler: onComletionHandler) {  // duvida? como saber se deu certo, se n ha retorno
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        do {
            try context.save()
            
            onCompletionHandler("Success on save")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
        
        print(context)
    }
    
    func delete(uuid: String, onCompletionHandler: onComletionHandler) {
        let context = getContext()
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
                onCompletionHandler("Successfully deleted")
                return
            }
            
            try context.save()
            
            onCompletionHandler("Entity Does Not exist")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
}
