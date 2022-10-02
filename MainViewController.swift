//
//  MainViewController.swift
//  Warning
//
//  Created by 이주송 on 2022/09/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var roomView_1: UIView!
    @IBOutlet weak var roomView_2: UIView!
    @IBOutlet weak var roomView_3: UIView!
    
    @IBOutlet weak var roomImageView_1: UIImageView!
    @IBOutlet weak var roomImageView_2: UIImageView!
    @IBOutlet weak var roomImageView_3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.roomView_1.backgroundColor = .mainRed
        self.roomView_2.backgroundColor = .mainRed
        self.roomView_3.backgroundColor = .mainRed
        self.roomImageView_1.cornerRadius = self.roomImageView_1.frame.width / 2
        self.roomImageView_2.cornerRadius = self.roomImageView_2.frame.width / 2
        self.roomImageView_3.cornerRadius = self.roomImageView_3.frame.width / 2
        
    }
    
    @IBAction func tapToReserveDetail(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ReserveDetail") as? ReserveDetail else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapToFirst(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        viewController.webSiteUrl = ROOM_URL.room_1
        viewController.roomName = ROOM_NAME.room_1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapToSecond(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController  else { return }
        viewController.webSiteUrl = ROOM_URL.room_2
        viewController.roomName = ROOM_NAME.room_2
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapToThird(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        viewController.webSiteUrl = ROOM_URL.room_3
        viewController.roomName = ROOM_NAME.room_3
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapToSetting(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//#if DEBUG
//import SwiftUI
//struct ViewController_Representable: UIViewControllerRepresentable {
//
//    func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        MainViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewController_Representable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewController_Representable()
//                .ignoresSafeArea()
//                .previewDisplayName("ViewController")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
//        }
//
//    }
//} #endif

// Opt + Command + Enter : 미리보기 창 열기
// Opt + Command + P : 미리보기 활성화
