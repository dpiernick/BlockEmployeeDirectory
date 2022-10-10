//
//  EmployeeSummaryView.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/5/22.
//

import Foundation
import UIKit

class EmployeeSummaryView: UIView {
    
    var employee: Employee
    
    var imageView = UIImageView(image: UIImage(systemName: "person"))
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    init(_ employee: Employee) {
        self.employee = employee
        super.init(frame: .zero)
        setupUI()
        fetchImage()
    }
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
                
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .customTextColor
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        addSubview(imageView, [imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                               imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
                               imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
                               imageView.heightAnchor.constraint(equalToConstant: 80),
                               imageView.widthAnchor.constraint(equalToConstant: 80),
                               imageView.centerYAnchor.constraint(equalTo: centerYAnchor)])


        let nameLabel = UILabel(employee.full_name, size: 20, weight: .bold)
        addSubview(nameLabel, [nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                               nameLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 12)])
        
        let teamLabel = UILabel(employee.team, size: 16, weight: .regular)
        addSubview(teamLabel, [teamLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                               teamLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
                               teamLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)])
        
        
        let emailLabel = UILabel(employee.email_address, size: 14, weight: .light)
        addSubview(emailLabel, [emailLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                emailLabel.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 4),
                                emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)])
        
        let phoneLabel = UILabel(employee.phone_number?.phoneNumberFormatted() ?? "--", size: 14, weight: .light)
        addSubview(phoneLabel, [phoneLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                                phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
                                phoneLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                                phoneLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)])
    }
    
    func fetchImage() {
        guard let urlString = employee.photo_url_small else { return }
        
        ImageCache.fetchImage(url: urlString) { image in
            self.imageView.image = image
        }
    }
}
