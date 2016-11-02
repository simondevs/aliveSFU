//
//  DataHandler.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-11-01.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import Foundation
import CoreData

class DataHandler {
    
    class func getExerciseArrayCount() -> Int{
        let moc = AppDataController().managedObjectContext
        let entityFetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
        do {
            let fetchedResult = try moc.fetch(entityFetchReq)
            return fetchedResult.count
        } catch {
            fatalError("Failed to fetch person: \(error)")
            return -1;
        }
    }
}
