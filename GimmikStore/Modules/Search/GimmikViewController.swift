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
    
    var delegate: GimmikCollectionViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        delegate.fetch("")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//         reloadCollection()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keypath = keyPath, keypath == "contentOffset", let gimmikCollectionView = object as? UICollectionView {
            searchBarTopConstraint.constant = -1 * gimmikCollectionView.contentOffset.y
        }
    }
    
    func setup() -> Void {
        title = Config.appTitle
        searchBar.barTintColor = Colors.appHeaderColor
        gimmikCollectionView.register(UINib(nibName: "GimmikCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gimmikCell")
        delegate = GimmikCollectionViewDelegate(viewController: self)
        gimmikCollectionView.dataSource = delegate.dataSource
        gimmikCollectionView.delegate = delegate
        addGimmikCollectionViewObserver()
        searchBar.delegate = delegate
        navigationController?.navigationBar.prefersLargeTitles = true
         navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchBarTopConstraint.constant = 0.0
        searchBar.placeholder = "Search"
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData(notification:)), name: NSNotification.Name(rawValue: "DataFetched"), object: nil)

    }

    func reloadCollection() -> Void {
        gimmikCollectionView.reloadData()
    }
    
    func addGimmikCollectionViewObserver() -> Void {
        gimmikCollectionView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
    @objc func reloadData(notification: NSNotification){
        reloadCollection()
    }
    
}
