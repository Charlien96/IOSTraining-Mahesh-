//
//  NetworkManager.swift
//  CollectionViewFlicker
//
//  Created by Admin on 14/03/2022.
//

import Foundation

protocol Images {
    
    func getImage(searchText: String)
}

class NetworkManager: Images {
    
    weak var viewController : RefreshView?
        init(viewController: RefreshView) {
            self.viewController = viewController
        }
        
        var data: [Photo] = []
    
    func getImage(searchText: String) {
            let urlstr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=\(searchText)&format=json&nojsoncallback=1"
            
            let url = URL(string: urlstr)
            
            guard url != nil else  {
                return
            }
            let session = URLSession.shared
            let datatask = session.dataTask(with: url!) {
                data, responce, error in
                
                let decoded = JSONDecoder()
                do{
                    let decodedResponce = try decoded.decode(PhotoData.self, from: data!)
                    self.data = decodedResponce.photos.photo
                   print("data")
                    
                    self.viewController?.refresh()
                
                }catch{
                    print(error.localizedDescription)
                }
            }
            datatask.resume()
        }
}
