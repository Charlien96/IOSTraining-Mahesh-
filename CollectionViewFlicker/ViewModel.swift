//
//  ViewModel.swift
//  CollectionViewFlicker
//
//  Created by Admin on 15/03/2022.
//

import Foundation

protocol ViewModelType: AnyObject {
    func updateImg(responce: PhotoData)
}

class ViewModel: ViewModelType {
    weak var delegate: RefreshView?
    let networkManager = NetworkManager()
    init(delegate: RefreshView) {
        self.delegate = delegate
    }
    
    var data: [Photo] = []
    
    func getImage(searchText: String) {
        networkManager.delegateViewModel = self
        networkManager.getImage(searchText: searchText)
    }
    
    func updateImg(responce: PhotoData) {
        self.data = responce.photos.photo
        DispatchQueue.main.async {
            self.delegate?.refresh()
        }
    }
}
