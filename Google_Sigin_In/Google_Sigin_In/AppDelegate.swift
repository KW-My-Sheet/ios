//
//  AppDelegate.swift
//  Google_Sigin_In
//
//  Created by 이주송 on 2022/09/11.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    // Google 로그인 인증 후 전달된 값 처리하기
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
      
      if let error = error {    // 에러 처리
        print("ERROR Google Sign In \(error.localizedDescription)")
        return
      }

      // 사용자 인증값 가져오기
      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

      // Firebase Auth에 인증정보 등록하기
      Auth.auth().signIn(with: credential) { _, _ in
        self.showMainViewController()    // 메인 화면으로 이동
      }
    }
    
    // 메인 화면으로 이동하기
    private func showMainViewController() {
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
      mainViewController.modalPresentationStyle = .fullScreen
      UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

