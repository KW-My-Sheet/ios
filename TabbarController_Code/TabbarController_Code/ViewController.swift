//
//  ViewController.swift
//  TabbarController_Code
//
//  Created by 이주송 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

#if DEBUG
// 1. Info.plist에서 Story Board 관련 파일 두개 지우기
// 2. Main.storyboadrd 지우기
// 3. Preview Randering Swift UI 코드 사용

import SwiftUI
struct ViewController_Representable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewController_Representable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewController_Representable()
                .ignoresSafeArea()
                .previewDisplayName("ViewController")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
        }
        
    }
} #endif
