//
//  MainVC.swift
//  Firebase
//
//  Created by 이주송 on 2022/09/09.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // 스와이프해서 뒤로가기 금지
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
