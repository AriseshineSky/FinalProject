//
//  BibleVerseTableViewCell.swift
//  FinalProject
//
//  Created by Mike Liu  on 6/13/19.
//  Copyright © 2019 Mike Liu. All rights reserved.
//

import UIKit

class BibleVerseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var verseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
