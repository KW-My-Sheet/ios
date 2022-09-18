//
//  ViewController.swift
//  TabbarController_Code
//
//  Created by 이주송 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    var TestButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true // corner radius 전용
        button.layer.cornerRadius = 5
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        button.backgroundColor = .green
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.autoLayout()
    }
    
    
}

extension ViewController {
    func autoLayout() {
        self.view.addSubview(self.TestButton)
        
        NSLayoutConstraint.activate([
            self.TestButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.TestButton.widthAnchor.constraint(equalToConstant: 60),
            self.TestButton.heightAnchor.constraint(equalToConstant: 60)
        ])


        self.view.addConstraint(NSLayoutConstraint(item: self.TestButton,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 20))
        self.view.addConstraint(NSLayoutConstraint(item: self.TestButton,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: -20))
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
