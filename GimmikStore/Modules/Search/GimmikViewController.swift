//
//  GimmikViewController.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var gimmikCollectionView: UICollectionView!
    
    let dataSource: GimmikCollectionViewDataSource = GimmikCollectionViewDataSource()
    let delegate: GimmikCollectionViewDelegate = GimmikCollectionViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.fetch(term: "puzzel")
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
         gimmikCollectionView.reloadData()
    }
    
    func setup() -> Void {
        gimmikCollectionView.register(UINib(nibName: "GimmikCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gimmikCell")
        gimmikCollectionView.dataSource = dataSource
        gimmikCollectionView.delegate = delegate
    }
    
}
