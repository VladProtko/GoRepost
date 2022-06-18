//
//  SaveTableViewCell.swift
//  GoReposter
//
//  Created by Admin on 14.03.22.
//

import UIKit

class SaveTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var descriptionPost: UILabel!
    @IBOutlet private weak var imagePost: UIImageView!
    @IBOutlet private weak var imageLogo: UIImageView!

    func set3(instItemModel: ContentModel) {
        imagePost.layer.cornerRadius = 10.0
        imageLogo.layer.cornerRadius = 15.0
        self.descriptionPost.text = instItemModel.caption
        self.label.text = instItemModel.fromAccName
        
        if let urlProfile = URL.init(string: instItemModel.formAccImage) {
            self.imageLogo.af_setImage(withURL: urlProfile)
        }
       
        
        if let item = instItemModel.content.first {
            if item.type == .image {
                if let urlImage = URL.init(string: item.contentUrl) {
                    self.imagePost.af_setImage(withURL: urlImage)
                }
            } else {
                print("HERE DECODE VIDEO FRAME")
            }
        }
    }

}
