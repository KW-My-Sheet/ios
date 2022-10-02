//
//  ReserveDetail.swift
//  Warning
//
//  Created by 이주송 on 2022/09/25.
//

import UIKit

class ReserveDetail: UIViewController {

    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        return button
    }()
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.title = "내 예약정보"
    }

}
