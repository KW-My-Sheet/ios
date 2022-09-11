//
//  MainViewController.swift
//  Google_Sigin_In
//
//  Created by 이주송 on 2022/09/11.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
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
    
    @IBAction func profileUpdateButtonTapped(_ sender: Any) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "토끼"
        changeRequest?.commitChanges { _ in
            let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? "고객"
            
            self.welcomeLabel.text = """
                환영합니다.
            \(displayName)님
            """
        }
    }
}

// 프로필 편집하기
