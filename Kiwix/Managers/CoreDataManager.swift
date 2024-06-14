//
//  CoreDataManager.swift
//  Kiwix
//
//  Created by FFK on 7.06.2024.
//

import UIKit
import CoreData

protocol WordRepositoryProtocol {
    func saveWord(word: String)
    func fetchWords() -> [String]?
}

final class CoreDataManager: WordRepositoryProtocol {
    
    static let shared = CoreDataManager()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveWord(word: String) {
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDWord")
        fetchRequest.predicate = NSPredicate(format: "word == %@", word)
        
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object as! NSManagedObject)
            }
            
            let newWord = NSEntityDescription.insertNewObject(forEntityName: "CDWord", into: context)
            newWord.setValue(word, forKey: "word")
            newWord.setValue(Date(), forKey: "timestamp")
            
            try context.save()
        } catch {
            print("Save/Delete Error: \(error.localizedDescription)")
        }
    }
    
    func fetchWords() -> [String]? {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDWord")
        
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let results = try context.fetch(fetchRequest) as? [NSManagedObject] ?? []
            return results.compactMap { $0.value(forKey: "word") as? String }
        } catch {
            print("Fetch Error: \(error.localizedDescription)")
        }
        return nil
    }
}
