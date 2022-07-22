//
//  MainViewController.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 16.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var personnelButtonView: UIView!
    @IBOutlet weak var equipmentButtonView: UIView!
    
    private let personnelButtonViewModel = CustomIconButtonViewModel(title: "Personnel", iconName: "person")
    private let equipmentButtonViewModel = CustomIconButtonViewModel(title: "Equipment", iconName: "equipment")
    
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.loadData { [weak self] error in
            self?.loaderView.isHidden = true
            self?.dayPickerView.dataSource = self
            self?.dayPickerView.delegate = self
        }
        
        configurepersonnelButton()
        configureEquipmentButton()
        
    }
    
    private func configurepersonnelButton() {
        let customPersonnelButton = CustomIconButton(with: personnelButtonViewModel)
        customPersonnelButton.backgroundColor = .lightGray
        customPersonnelButton.layer.cornerRadius = 16
        customPersonnelButton.addTarget(self, action: #selector(personnelButtonPressed), for: .touchUpInside)
        personnelButtonView.addSubview(customPersonnelButton)
        customPersonnelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customPersonnelButton.topAnchor.constraint(equalTo: personnelButtonView.topAnchor),
            customPersonnelButton.bottomAnchor.constraint(equalTo: personnelButtonView.bottomAnchor),
            customPersonnelButton.leadingAnchor.constraint(equalTo: personnelButtonView.leadingAnchor),
            customPersonnelButton.trailingAnchor.constraint(equalTo: personnelButtonView.trailingAnchor)
        ])
    }
    
    private func configureEquipmentButton() {
        let customEquipmentButton = CustomIconButton(with: equipmentButtonViewModel)
        customEquipmentButton.backgroundColor = .lightGray
        customEquipmentButton.layer.cornerRadius = 16
        customEquipmentButton.addTarget(self, action: #selector(equipmentButtonPressed), for: .touchUpInside)
        equipmentButtonView.addSubview(customEquipmentButton)
        customEquipmentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customEquipmentButton.topAnchor.constraint(equalTo: equipmentButtonView.topAnchor),
            customEquipmentButton.bottomAnchor.constraint(equalTo: equipmentButtonView.bottomAnchor),
            customEquipmentButton.leadingAnchor.constraint(equalTo: equipmentButtonView.leadingAnchor),
            customEquipmentButton.trailingAnchor.constraint(equalTo: equipmentButtonView.trailingAnchor)
        ])
    }
    
    
    @objc private func personnelButtonPressed() {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ChosenDayPersonnelInformationViewController") as? ChosenDayPersonnelInformationViewController else { return }
        let selectedRow = dayPickerView.selectedRow(inComponent: 0)
        
        if let personnel = dataManager.getpersonnellData(for: selectedRow) {
            nextVC.chosenPersonnel = personnel
            if let day = dataManager.getpersonnellData(for: selectedRow)?.day {
                nextVC.title = "Personnel info for \(day) day"
            }
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }
    
    @objc private func equipmentButtonPressed() {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ChosenDayEquipmentInformationViewController") as? ChosenDayEquipmentInformationViewController else { return }
        let selectedRow = dayPickerView.selectedRow(inComponent: 0)
        
        if let equipment = dataManager.getEquipmentData(for: selectedRow) {
            nextVC.chosenEquipment = equipment
            if let day = dataManager.getpersonnellData(for: selectedRow)?.day {
                nextVC.title = "Equipment info for \(day) day"
            }
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    @IBAction func allpersonnelButtonPressed(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "AllPersonnelInformationViewController") as? AllPersonnelInformationViewController else { return }
            nextVC.personnelArray = dataManager.personnelData
            nextVC.title = "personnel info"
            self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Picker

    extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dataManager.personnelCount
        }
        
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            guard let personnel = dataManager.getpersonnellData(for: row) else { return NSAttributedString(string: "1", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]) }
            let attributedString = NSAttributedString(string: "\(personnel.day)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            return attributedString
        }
    }
