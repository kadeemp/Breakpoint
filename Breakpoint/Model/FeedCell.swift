//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Kadeem Palacios on 5/3/18.
//  Copyright © 2018 Kadeem Palacios. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLabl: UILabel!

    @IBOutlet weak var contentLbl: UILabel!

    func configureCell(profileImg:UIImage, email:String, content: String) {
        self.profileImg.image = profileImg
        self.contentLbl.text = content
        self.emailLabl.text = email

    }

}
