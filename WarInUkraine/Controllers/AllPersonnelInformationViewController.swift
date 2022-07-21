//
//  InformationViewController.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 17.07.2022.
//

import UIKit

class AllPersonnelInformationViewController: UIViewController {
    @IBOutlet weak var informationTableView: UITableView!
    
    var personnelArray = [PersonnelInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.reloadData()
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension AllPersonnelInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return personnelArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentDay = personnelArray[section]
        if currentDay.prisonersOfWar == nil {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Day\(personnelArray[section].day):  \(personnelArray[section].date)"
        return title
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .gray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
            let currentDay = personnelArray[indexPath.section]
            if indexPath.row == 0 {
                cell.updateCell(parameter:"Personnel loses", quantity: currentDay.personnel, description: currentDay.description, image: "dead_soldiers")
            } else if indexPath.row == 1 {
                if let prisoners = currentDay.prisonersOfWar {
                cell.updateCell(parameter:"Prisoners of war", quantity: prisoners, description: "", image: "russian_pow")
                }
            }
        return cell
    }
}
