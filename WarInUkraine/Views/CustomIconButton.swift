//
//  CustomIconButton.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 17.07.2022.
//

import Foundation
import UIKit

struct CustomIconButtonViewModel {
    let title: String
    let iconName: String
}

class CustomIconButton: UIButton {
    private let myIcon = UIImageView()
    private let myTitleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        return label
    }()
    
    init(with viewModel: CustomIconButtonViewModel) {
        super.init(frame: .zero)
        
        configure(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    public func configure(with viewModel: CustomIconButtonViewModel) {
        self.addSubview(myTitleLabel)
        self.addSubview(myIcon)
        
        myIcon.image = UIImage(named: viewModel.iconName)
        myIcon.contentMode = .scaleAspectFit
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myIcon.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            myIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            myIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            myIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
        
        myTitleLabel.text = viewModel.title
        myTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            myTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            myTitleLabel.leadingAnchor.constraint(equalTo: myIcon.trailingAnchor),
            myTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
