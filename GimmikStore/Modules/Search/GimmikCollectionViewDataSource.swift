//
//  GimmikCollectionViewDataSource.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikCollectionViewDataSource: NSObject {
    
    var data: [Gimmik] = []
    
    func fetch(term: String) -> Void {
        print("fetching")
        ApiClient.search(term: term) { result in
            guard let result = result?.results else {
                print("nil")
                return
            }
            self.data = result
        }
    }
}

extension GimmikCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gimmikCell", for: indexPath) as! GimmikCollectionViewCell
        cell.fill(with: self.data[indexPath.row])
        return cell
    }
}
