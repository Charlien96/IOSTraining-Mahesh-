//
//  FavoriteViewController.swift
//  CollectionViewFlicker
//
//  Created by Admin on 17/03/2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favCollectionView: UICollectionView!
    var favPhotos: [ImageEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        favPhotos = ImageEntity.getEntity(moc: appDelegate.persistentContainer.viewContext)
        favCollectionView.reloadData()
    }
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favColViewCell", for: indexPath) as! CollectionViewCell
        let farm = favPhotos[indexPath.row].farm 
        let server = favPhotos[indexPath.row].server ?? ""
        let id = favPhotos[indexPath.row].id ?? ""
        let secret = favPhotos[indexPath.row].secret ?? ""
        let imageReturnedURL = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg"
        cell.favImgView.downLoadImage(owner: imageReturnedURL)
        return cell
    }
}
