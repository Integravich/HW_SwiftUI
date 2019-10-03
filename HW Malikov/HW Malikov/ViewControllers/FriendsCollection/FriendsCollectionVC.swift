//
//  FriendsCollectionVC.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit
import RealmSwift

//private let reuseIdentifier = "Cell"

class FriendsCollectionVC: UICollectionViewController {

    var currentFriendId: String? = nil
    var picUrls = [String]()
    
    // для Layout
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 20.0,
                                     left: 15.0,
                                     bottom: 20.0,
                                     right: 15.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // загружаем фотографии стены друга из базы Realm
        do {
            let realm = try Realm()
            let photoFromRealm = realm.objects(WallPhotoOfUser.self)
            for pic in photoFromRealm {
                if pic.userId == currentFriendId {
                    print("извлечено из базы \(pic.photoUrl)")
                    picUrls.append(pic.photoUrl)
                }
            }
        } catch {
            print(error)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return picUrls.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhoto", for: indexPath) as! FriendsCollectionViewCell
        
        // Получаем фото друга для конкретной строки
        let imageUrl = URL(string: picUrls[indexPath.row])!
        let imageData = try! Data(contentsOf: imageUrl)
        let friendPhoto = UIImage(data: imageData)
        
        // Устанавливаем фото в ячейку
        cell.friendImageView.image = friendPhoto
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
