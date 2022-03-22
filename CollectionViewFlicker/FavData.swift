//
//  FavData.swift
//  CollectionViewFlicker
//
//  Created by Admin on 22/03/2022.
//

import Foundation
import CoreData

extension ImageEntity {
    static func saveEntity(server: String, id: String, secret: String, farm: Int, moc:NSManagedObjectContext){
        
        let imageEntity = NSEntityDescription.insertNewObject(forEntityName: "ImageEntity", into: moc) as! ImageEntity
        
        imageEntity.farm = Int16(farm)
        imageEntity.server = server
        imageEntity.id = id
        imageEntity.secret = secret
    }
    
    static func getEntity(moc:NSManagedObjectContext) -> [ImageEntity]
    {
        let fr = ImageEntity.fetchRequest()
        
        do {
            let entity = try moc.fetch(fr)
            return entity
        }catch{
            
            print(error.localizedDescription)

            return []
        }
    }
}
