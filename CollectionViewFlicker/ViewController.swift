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
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        viewModel = ViewModel(delegate: self)
        viewModel.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            viewModel.getImage(searchText: text)
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colViewCell", for: indexPath) as! CollectionViewCell
        let search = viewModel.data[indexPath.row]
        
        let farmValue = search.farm
        let server = search.server
        let id = search.id
        let secretValue = search.secret
        
        let imageReturnedURL = "https://farm\(farmValue).staticflickr.com/\(server)/\(id)_\(secretValue)_m.jpg"
        
        cell.imgView.downLoadImage(owner: imageReturnedURL)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageObjectContext = appDelegate.persistentContainer.viewContext
        ImageEntity.saveEntity(server: viewModel.data[indexPath.row].server, id: viewModel.data[indexPath.row].id, secret: viewModel.data[indexPath.row].secret, farm: viewModel.data[indexPath.row].farm, moc: manageObjectContext)
        appDelegate.saveContext()
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

