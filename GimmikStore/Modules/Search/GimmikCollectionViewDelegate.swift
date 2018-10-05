//
//  GimmikCollectionViewDelegate.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikCollectionViewDelegate: NSObject {

}

extension GimmikCollectionViewDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let edgeInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        return CGSize(width: collectionView.frame.width - edgeInsets.left - edgeInsets.right, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
    }
    

}

extension GimmikCollectionViewDelegate: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        dataSource.fetch(term: "")
        viewController?.reloadCollection()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        dataSource.fetch(term: searchText)
        viewController?.reloadCollection()
}
