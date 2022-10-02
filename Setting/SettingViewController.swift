//
//  SettingViewController.swift
//  Warning
//
//  Created by 이주송 on 2022/09/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - Variable Initializaiton
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        return button
    }()
    
    var myTableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    let isPushOn = UIApplication.shared.isRegisteredForRemoteNotifications
    let iOSItems: [String] = ["제 1열람실","제 2열람실","제 3열람실"]
    let AOSItems: [String] = ["개발 및 피드백", "버전 1.0.0"]
    let sections: [String] = ["중앙도서관 열람실 예약 알림", "앱 정보"]
        
    
    //MARK: - Main Function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.aboutTableView()
        self.autoLayout()
        self.registerCell()
        self.aboutNavigation()
    }
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func aboutNavigation() {
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.title = "설정"
    }
    
    func aboutTableView() {
        self.myTableView.backgroundColor = .systemGray6
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
    func registerCell() {
        self.myTableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
    }
    
}

//MARK: - AutoLayout
extension SettingViewController {
    func autoLayout() {
        self.view.addSubview(self.myTableView)
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
    
    func developAndFeedback() {
        let alert = UIAlertController(title: "개발 및 피드백", message: "jusong23@naver.com", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - TableView Delegate
extension SettingViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
//        {
//            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//            headerView.backgroundColor = .mainRed
//            return headerView
//        }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .mainRed
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            print("Value: \(iOSItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(AOSItems[indexPath.row])")
            if indexPath.row == 0 {
                self.developAndFeedback()
            }
        } else {
            return
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.testLabel.text = "\(iOSItems[indexPath.row])"
            cell.toggleSwitch.isHidden = false
            if cell.toggleSwitch.isOn {
                UIApplication.shared.registerForRemoteNotifications()
                print(self.isPushOn)
            } else {
                UIApplication.shared.unregisterForRemoteNotifications()
                print(self.isPushOn)
            }
        } else if indexPath.section == 1 {
            cell.testLabel.text = "\(AOSItems[indexPath.row])"
            cell.testLabel.textColor = .mainRed
            if indexPath.row == 0 {
                cell.chevronButton.isHidden = false
            }
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0 {
             return iOSItems.count
         } else if section == 1 {
             return AOSItems.count
         } else {
             return 0
         }
     }

}


