//
//  GimmikCollectionViewDataSource.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikCollectionViewDataSource: NSObject {
    
    private var data: [Gimmik] = []
    private var searchedData: [Gimmik] = []
    private var isSearching: Bool = false
    
    func fetch(term: String) -> Void {
        print(term)
        if term.isEmpty {
            isSearching  = false
        } else {
            isSearching  = true
            ApiClient.search(term: term) { result in
                guard let result = result?.results else {
                    return
                }
                
                if self.isSearching {
                    self.searchedData = result
                } else {
                    self.data = result
                }
                
            }
        }
    }
    
    func filter(at indexPath: IndexPath) -> Gimmik {
        if isSearching {
            return searchedData[indexPath.item]
        } else {
            return data[indexPath.item]
        }
    }
}

extension GimmikCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return self.searchedData.count
        } else {
            return self.data.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gimmikCell", for: indexPath) as! GimmikCollectionViewCell
        cell.fill(with: filter(at: indexPath))
        return cell
    }
}
