//
//  GimmikCollectionViewCell.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import UIKit
import Kingfisher

class GimmikCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOrganization: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgApp.image = nil
    }
    
    func fill(with gimmik: Gimmik) -> Void {
        guard let image  = gimmik.getImageIcon() else {
            return;
        }
        imgApp.kf.setImage(with: URL(string: image))
        lblTitle.text = gimmik.getName()
        lblDescription.text = gimmik.getDescription()
        lblOrganization.text = gimmik.getMaker()
    }

}
