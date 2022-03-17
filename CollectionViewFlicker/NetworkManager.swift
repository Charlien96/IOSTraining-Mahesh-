//
//  NetworkManager.swift
//  CollectionViewFlicker
//
//  Created by Admin on 14/03/2022.
//

import Foundation

protocol ImageSearch {
    
    var delegateViewModel: ViewModelType? {get set}
    func getImage(searchText: String)
}

class NetworkManager: ImageSearch {
    
    weak var delegateViewModel: ViewModelType?
    
    func getImage(searchText: String) {
            let urlstr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=\(searchText)&format=json&nojsoncallback=1"
            
            let url = URL(string: urlstr)
            
            guard url != nil else  {
                return
            }
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!) {
                data, responce, error in
                guard let data = data else {
                    return
                }
                let decoded = JSONDecoder()
                do{
                    let decodedResponce = try decoded.decode(PhotoData.self, from: data)
                    self.delegateViewModel?.updateImg(responce: decodedResponce)
                }catch{
                    print(error.localizedDescription)
                }
            }
            dataTask.resume()
        }
}
