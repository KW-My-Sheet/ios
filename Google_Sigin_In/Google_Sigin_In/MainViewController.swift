//
//  MainViewController.swift
//  Google_Sigin_In
//
//  Created by 이주송 on 2022/09/11.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
          let firebaseAuth = Auth.auth()

          do {
            // 로그아웃 시도하기
              try firebaseAuth.signOut()
              self.navigationController?.popToRootViewController(animated: true)
          } catch let signOutError as NSError {
              print("ERROR: signout \(signOutError.localizedDescription)")
          }
    }
    
}
