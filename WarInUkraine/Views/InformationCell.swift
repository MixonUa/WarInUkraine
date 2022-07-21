//
//  InformationCell.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 17.07.2022.
//

import Foundation
import UIKit

class InformationCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellShadeView: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.contentMode = .scaleAspectFill
        cellShadeView.backgroundColor = .black
        cellShadeView.alpha = 0.4
        informationLabel.textColor = .white
        informationLabel.text = ""
    }
    
    func updateCell(parameter: String, quantity: Int, description: String, image: String) {
        if description == "" {
        informationLabel.text = "\(parameter) - \(quantity)"
        cellImage.image = UIImage(named: image)
        } else {
            informationLabel.text = "\(parameter) - \(description) \(quantity)"
            cellImage.image = UIImage(named: image)
        }
    }
}
