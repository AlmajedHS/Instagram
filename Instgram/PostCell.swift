//
//  PostCell.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/4/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {

   
    @IBOutlet weak var postImage: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    var post: Post! {
        didSet {
            self.postImage.file = post.media
            self.postImage.loadInBackground()
            self.userLabel.text = post.author.username
            self.captionLabel.text = post.caption
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
