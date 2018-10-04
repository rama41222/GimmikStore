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
    
    func fetch() -> Void {
        data = [ Gimmik(id: "1", name: "biTunes", image: "v", description: "ciTunes Search API: Search Examples - Apple Developer", organization: "d"),
                 Gimmik(id: "2", name: "bviTunes", image: "viTunes Search API: Search Examples - Apple Developer", description: "c", organization: "d"),
                 Gimmik(id: "3", name: "bviTunes", image: "v", description: "ciTunes Search API: Search Examples - Apple Developer", organization: "d"),
                 Gimmik(id: "4", name: "bviTunes", image: "v", description: "ciTunes Search API: Search Examples - Apple Developer", organization: "d"),
                 Gimmik(id: "5", name: "bviTunes", image: "v", description: "ciTunes Search API: Search Examples - Apple Developer", organization: "d"),
                 Gimmik(id: "6", name: "bviTunes", image: "v", description: "ciTunes Search API: Search Examples - Apple Developer", organization: "d")
        ]
    }
}

extension GimmikCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gimmikCell", for: indexPath) as! GimmikCollectionViewCell
        cell.fill(with: data[indexPath.row])
        return cell
    }
}
