//
//  CustomTableView.swift
//  PracticeProject
//
//  Created by 이주송 on 2022/09/06.
//

import Foundation

import UIKit

class CustomTableView: UIView {
  
  let navigationView: UIView = {
    let view = UIView()
    
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .black
    view.alpha = 0.5
    return view
  }()
  
  let tableView: UITableView =  {
    let tableView = UITableView()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableFooterView = UIView()
    tableView.backgroundColor = .clear
    tableView.estimatedSectionHeaderHeight = 50
    tableView.rowHeight = 200
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.sectionHeaderHeight = UITableView.automaticDimension
    return tableView
  }()
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    self.addSubview(self.tableView)
    self.addSubview(self.navigationView)
    
    self.navigationView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    self.navigationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.navigationView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    self.navigationView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    
    self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
  }
}
