//
//  ViewController.swift
//  Block Directory
//
//  Created by Dave Piernick on 10/4/22.
//

import UIKit

class DirectoryViewController: UIViewController, FilterBarDelegate {
    
    var model: EmployeeModel? {
        didSet {
            updateUIForEmployees()
        }
    }
    
    lazy var filterBar = FilterBar(delegate: self)
    var scrollView = UIScrollView(false)
    var stackView = UIStackView(axis: .vertical)
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTeamMembers()
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        
        view.addSubview(filterBar, [filterBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    filterBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                    filterBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        view.addSubview(scrollView, [scrollView.topAnchor.constraint(equalTo: filterBar.bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        scrollView.addSubviewWithConstraints(stackView)
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        scrollView.refreshControl = refreshControl

        view.bringSubviewToFront(filterBar)
    }

    func fetchTeamMembers() {
        NetworkRequest.request(method: .get, urlString: EmployeeURLs.correctURL) { data in
            if let data = data, let employeeData = EmployeeModel.decode(data: data) {
                self.model = employeeData
            } else {
                self.model = nil
            }
        }
    }

    func updateUIForEmployees() {
        stackView.removeAllSubviews()

        guard let model = model else {
            updateUIForError()
            return
        }
        
        guard model.employees.count > 0 else {
            updateUIForEmpty()
            return
        }
        
        var visibleEmployees = model.employees
        if let filterType = filterBar.employeeType {
            visibleEmployees = visibleEmployees.filter({ $0.employee_type == filterType })
        }
        
        for employee in visibleEmployees {
            let v = EmployeeSummaryView(employee)
            stackView.addArrangedSubview(v)
        }
        
        filterBar.updateLabelAnimated(model.employees.count, true)
    }
    
    func updateUIForError() {
        let errorImage = UIImageView(false)
        errorImage.image = UIImage(systemName: "exclamationmark.circle")
        errorImage.tintColor = .gray
        stackView.addSubview(errorImage, [errorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                          errorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                          errorImage.widthAnchor.constraint(equalToConstant: 50),
                                          errorImage.heightAnchor.constraint(equalToConstant: 50)])
        
        let label = UILabel("Something went wrong")
        label.textColor = .gray
        stackView.addSubview(label, [label.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
                                     label.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: 8)])
    }
    
    func updateUIForEmpty() {
        let errorImage = UIImageView(false)
        errorImage.image = UIImage(systemName: "person.crop.circle.badge.questionmark")
        errorImage.tintColor = .gray
        stackView.addSubview(errorImage, [errorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                          errorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                          errorImage.widthAnchor.constraint(equalToConstant: 50),
                                          errorImage.heightAnchor.constraint(equalToConstant: 50)])
        
        let label = UILabel("There doesn't appear to be anything here")
        label.textColor = .gray
        stackView.addSubview(label, [label.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
                                     label.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: 8)])
    }
    
    @objc func refresh() {
        fetchTeamMembers()
        refreshControl.endRefreshing()
    }
    
    func filterUpdated() {
        updateUIForEmployees()
    }
}
