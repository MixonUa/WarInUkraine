//
//  PersonnelInformationLine.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 20.07.2022.
//

import Foundation
import UIKit

class PersonnelInformationLine: UIView {
    private let imageView = UIImageView()
    private let shadeView = UIView()
    private let informationLabel = UILabel()
    
    init(title: String, quantity: Int, imageName: String) {
        super.init(frame: .zero)
        configure()
        imageView.image = UIImage(named: imageName)
        informationLabel.text = "\(title) \(quantity)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        shadeView.backgroundColor = .black
        shadeView.alpha = 0.4
        shadeView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shadeView)
        NSLayoutConstraint.activate([
            shadeView.topAnchor.constraint(equalTo: topAnchor),
            shadeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadeView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        informationLabel.textAlignment = .left
        informationLabel.textColor = .white
        informationLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(informationLabel)
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: topAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
