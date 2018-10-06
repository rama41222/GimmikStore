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
    
    func fetch(term: String) -> Void {
//        if !term.isEmpty {
            ApiClient.search(term: term) { result in
                guard let result = result?.results else {
                    self.data = []
                    return
                }
                self.data = result
                NotificationCenter.default.post(name: NSNotification.Name(Events.DataFetched), object: nil)
            }
//        }
    }
    
    func filter(at indexPath: IndexPath) -> Gimmik {
         return data[indexPath.item]
    }
}

extension GimmikCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomUIConstants.gimmikCell, for: indexPath) as! GimmikCollectionViewCell
        cell.fill(with: filter(at: indexPath))
        return cell
    }
}
