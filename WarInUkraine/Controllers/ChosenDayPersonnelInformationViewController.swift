//
//  ChosenDayPersonnelInformationViewController.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 20.07.2022.
//

import UIKit

class ChosenDayPersonnelInformationViewController: UIViewController {
    @IBOutlet weak var informationContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var chosenPersonnel: PersonnelInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = chosenPersonnel else { return }
        titleLabel.text = "Date:  \(item.date)"
        let personnelLine = PersonnelInformationLine(title: "Personnel loses - \(item.description)", quantity: item.personnel, imageName: "dead_soldiers")
        informationContainerView.addSubview(personnelLine)
        personnelLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personnelLine.topAnchor.constraint(equalTo: informationContainerView.topAnchor),
            personnelLine.trailingAnchor.constraint(equalTo: informationContainerView.trailingAnchor),
            personnelLine.leadingAnchor.constraint(equalTo: informationContainerView.leadingAnchor),
            personnelLine.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        guard let pow = item.prisonersOfWar else { return }
        let prisonersLine = PersonnelInformationLine(title: "Prisoners of war -", quantity: pow, imageName: "russian_pow")
        informationContainerView.addSubview(prisonersLine)
        prisonersLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prisonersLine.bottomAnchor.constraint(equalTo: informationContainerView.bottomAnchor),
            prisonersLine.trailingAnchor.constraint(equalTo: informationContainerView.trailingAnchor),
            prisonersLine.leadingAnchor.constraint(equalTo: informationContainerView.leadingAnchor),
            prisonersLine.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}

