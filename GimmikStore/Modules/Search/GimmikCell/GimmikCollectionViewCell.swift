//
//  GimmikCollectionViewCell.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit

class GimmikCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOrganization: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imgApp.image = nil
        // Initialization code
    }
    
    func fill(with gimmik: Gimmik) -> Void {
//        imgApp.image = samp
        lblTitle.text = gimmik.name
        lblDescription.text = gimmik.description
        lblOrganization.text = gimmik.organization
    }

}
