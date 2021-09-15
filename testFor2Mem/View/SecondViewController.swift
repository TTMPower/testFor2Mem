//
//  SecondViewController.swift
//  testFor2Mem
//
//  Created by Владислав Вишняков on 14.09.2021.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var shared = Network.task
 
    @IBOutlet weak var myCollectionView: UICollectionView!
    var imageURLs = [String]()
    
    override func viewDidLoad() {
        myCollectionView.reloadData()
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! CollectionViewCell
        let index = imageURLs[indexPath.row]
        var imageResourse = [ImageResource]()
        shared.getImage(url: index, complition: { resource in
            imageResourse = resource
        })
        cell.imageView.kf.setImage(with: imageResourse.first)
        return cell
    }
}
