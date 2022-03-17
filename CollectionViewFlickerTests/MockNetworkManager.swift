//
//  MockNetworkManager.swift
//  CollectionViewFlickerTests
//
//  Created by Admin on 15/03/2022.
//

import Foundation
@testable import CollectionViewFlicker

class MockNetworkManager: ImageSearch {
    
    var delegateViewModel: ViewModelType?

    func getImage(searchText: String) {
        let bundle = Bundle(for: MockNetworkManager.self)
        let url = bundle.url(forResource: "Images", withExtension:".json")!
        
        guard url != nil else  {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            
            let decoded = JSONDecoder()
            do{
                let decodedResponce = try decoded.decode(PhotoData.self, from: data)
                self.delegateViewModel?.updateImg(responce: decodedResponce)
            }catch{
                print(error.localizedDescription)
            }
        }catch {
            
        }
    }
}

