//
//  FilterBar.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/9/22.
//

import Foundation
import UIKit

protocol FilterBarDelegate {
    func filterUpdated()
}

class FilterBar: UIView {
    
    var delegate: FilterBarDelegate
    
    var employeeType: EmployeeType? {
        didSet {
            delegate.filterUpdated()
            filterButton.setTitle(String.employeeTypeFormatted(employeeType), for: .normal)
        }
    }
    
    var label = UILabel("", size: 16, weight: .bold)
    
    lazy var filterButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "All"
        config.baseForegroundColor = .customTextColor
        config.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)

        return button
    }()
    
    lazy var teamPicker: UITextField = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
                
        let tf = UITextField(false)
        tf.isHidden = true
        tf.inputView = picker
        return tf
    }()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(delegate: FilterBarDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let topLine = UIView(false)
        topLine.backgroundColor = .gray
        addSubview(topLine, [topLine.topAnchor.constraint(equalTo: topAnchor),
                             topLine.widthAnchor.constraint(equalTo: widthAnchor),
                             topLine.heightAnchor.constraint(equalToConstant: 1)])
        
        addSubview(label, [label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           label.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 8)])
        
        addSubview(filterButton, [filterButton.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor),
                                  filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                                  filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                  filterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)])
        
        let bottomLine = UIView(false)
        bottomLine.backgroundColor = .gray
        addSubview(bottomLine, [bottomLine.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
                                bottomLine.widthAnchor.constraint(equalTo: widthAnchor),
                                bottomLine.heightAnchor.constraint(equalToConstant: 1),
                                bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        addSubview(teamPicker)
    }
    
    @objc func filterButtonTapped() {
        if teamPicker.isFirstResponder {
            teamPicker.resignFirstResponder()
        } else {
            teamPicker.becomeFirstResponder()
        }
    }
    
    func updateLabelAnimated(_ count: Int, _ animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.label.alpha = 0
            } completion: { _ in
                self.updateLabel(count)
                
                UIView.animate(withDuration: 0.3) {
                    self.label.alpha = 1
                }
            }
        } else {
            updateLabel(count)
        }
    }
    
    private func updateLabel(_ count: Int) {
        if count == 1 {
            self.label.text = "\(count) Employee"
        } else {
            self.label.text = "\(count) Employees"
        }
    }
}

extension FilterBar: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        EmployeeType.allCases.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 1: return "Full Time"
        case 2: return "Part Time"
        case 3: return "Contractor"
        default: return "All"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1: employeeType = .fullTime
        case 2: employeeType = .partTime
        case 3: employeeType = .contractor
        default: employeeType = nil
        }
        teamPicker.resignFirstResponder()
    }
}
