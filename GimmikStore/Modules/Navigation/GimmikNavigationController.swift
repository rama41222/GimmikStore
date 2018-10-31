//
//  GimmikNavigationController.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/4/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
