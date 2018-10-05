//
//  CircularButton.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/5/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation
import UIKit

class CircularButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
