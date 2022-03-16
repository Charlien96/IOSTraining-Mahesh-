//
//  MockNetworkManager.swift
//  CollectionViewFlickerTests
//
//  Created by Admin on 15/03/2022.
//

import Foundation
@testable import CollectionViewFlicker

class MockNetworkManager: Images {

    var data: [Photo] = []

    func getImage(searchText: String) {
        let bundle = Bundle(for: MockNetworkManager.self)
        let url = bundle.url(forResource: "Images", withExtension:".json")!
        
        guard url != nil else  {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url) {
            data, responce, error in
            
            let decoded = JSONDecoder()
            do{
                let decodedResponce = try decoded.decode(PhotoData.self, from: data!)
                self.data = decodedResponce.photos.photo
                print("data")
                
            
            }catch{
                print("No data")
            }
        }
        datatask.resume()
    }
}

