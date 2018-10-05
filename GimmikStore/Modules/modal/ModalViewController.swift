//
//  ModalViewController.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/5/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit
import Kingfisher

class ModalViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var seller: UILabel!
    @IBOutlet weak var price: CircularButton!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var modalView: UIView!
    var gimmik: Gimmik?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setValues()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtn(_ sender: CircularButton) {
        closeView()
    }
    
    func setup() -> Void {
        modalView.layer.cornerRadius = 10.0
        modalView.layer.masksToBounds = true
        image.layer.cornerRadius = 10.0
    }
    
    func setValues() -> Void {
        name.text = gimmik?.getName()
        seller.text = gimmik?.sellerName
        image.kf.setImage(with: URL(string: gimmik?.getImageIcon() ?? ""))
        desc.text = gimmik?.getDescription()
        type.text = gimmik?.getKind()
        genre.text = gimmik?.primaryGenreName
        
        guard let appPrice = gimmik?.getPrice() else {
            return
        }
        price.setTitle("Free", for: .normal)

    }
    
    func closeView() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
}
