//
//  ViewController.swift
//  CollectionViewFlicker
//
//  Created by Admin on 10/03/2022.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var networkManager : NetworkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        searchBar.delegate = self
        networkManager = NetworkManager(viewController: self)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            networkManager.getImage(searchText: text)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkManager.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colViewCell", for: indexPath) as! CollectionViewCell
        let search = networkManager.data[indexPath.row]
        
        let farmValue = search.farm
        let server = search.server
        let id = search.id
        let secretValue = search.secret
        
        let imageReturnedURL = "https://farm\(farmValue).staticflickr.com/\(server)/\(id)_\(secretValue)_m.jpg"
        
        cell.imgView.downLoadImage(owner: imageReturnedURL)
        
        return cell
    }
}

protocol RefreshView: AnyObject{
    
    func refresh()
}

extension ViewController: RefreshView{
    
    func refresh() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

