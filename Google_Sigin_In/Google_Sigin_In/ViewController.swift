//
//  ViewController.swift
//  Google_Sigin_In
//
//  Created by 이주송 on 2022/09/11.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GIDSignIn.sharedInstance().presentingViewController = self
    }

    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
    }
    
}

