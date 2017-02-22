//
//  MyImageTableViewCell.swift
//  PhotoViewer
//
//  Created by Ryan Riebling on 2/22/17.
//  Copyright © 2017 Ryan Riebling. All rights reserved.
//

import UIKit

class MyImageTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myImageTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                myImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                myImageView.addConstraint(aspectConstraint!)
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }

    func setCustomImage(image : UIImage) {

        let aspect = image.size.width / image.size.height

        let constraint = NSLayoutConstraint(item: myImageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: myImageView, attribute: NSLayoutAttribute.height, multiplier: aspect, constant: 0.0)
        constraint.priority = 999

        aspectConstraint = constraint

        myImageView.image = image
    }
}
