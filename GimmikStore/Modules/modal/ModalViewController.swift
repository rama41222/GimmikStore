//
//  ModalViewController.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/5/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var modalView: UIView!
    var gimmik: Gimmik?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtn(_ sender: CircularButton) {
        closeView()
    }
    
    func setup() -> Void {
        modalView.layer.cornerRadius = 10.0
        modalView.layer.masksToBounds = true
    }
    
    func setValues() -> Void {
        
    }
    
    func closeView() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
}
