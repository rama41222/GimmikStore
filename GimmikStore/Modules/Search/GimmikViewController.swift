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
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keypath = keyPath, keypath == "contentOffset", let gimmikCollectionView = object as? UICollectionView {
            searchBarTopConstraint.constant = -1 * gimmikCollectionView.contentOffset.y
        }
    }
    
    func setup() -> Void {
        title = Config.appTitle
        gimmikCollectionView.register(UINib(nibName: "GimmikCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gimmikCell")
        gimmikCollectionView.dataSource = dataSource
        gimmikCollectionView.delegate = delegate
        addGimmikCollectionViewObserver()
        navigationController?.navigationBar.prefersLargeTitles = true
         navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchBarTopConstraint.constant = 0.0

       
        searchBar.barStyle = .default
    
        
        definesPresentationContext = true

    }

    func reloadCollection() -> Void {
        gimmikCollectionView.reloadData()
    }
    
    func addGimmikCollectionViewObserver() -> Void {
        gimmikCollectionView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
}
