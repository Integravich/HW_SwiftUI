//
//  FriendsCollectionVC+UICollectionViewDelegateFlowLayout.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 04/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

// MARK: - Collection View Flow Layout Delegate
extension FriendsCollectionVC : UICollectionViewDelegateFlowLayout {
    //1 выдает размер ячейки для layout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2 общее пространство, занимаемое отступами
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        // доступная ширина
        let availableWidth = view.frame.width - paddingSpace
        // ширина одной ячейки
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3 returns the spacing between the cells, headers, and footers
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4 This method controls the spacing between each line in the layout. You want this to match the padding at the left and right.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
