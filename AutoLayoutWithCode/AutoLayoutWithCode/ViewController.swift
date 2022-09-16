//
//  ViewController.swift
//  newAutoLayout
//
//  Created by 이주송 on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {

//MARK: - Attribute Inspector
    // 속성
    var myFirstView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // corner radius 전용
        return view
    }()

    var mySecondView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // corner radius 전용
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.autoLayout()
    }
    
//MARK: - Size Inspector
    func autoLayout() {
        // MARK: - First View
        self.view.addSubview(myFirstView)
        NSLayoutConstraint.activate([
            myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // x축 위치
            myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200), // y축 위치
            myFirstView.widthAnchor.constraint(equalToConstant: 100),
            myFirstView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // MARK: - Second View
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
            mySecondView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            mySecondView.widthAnchor.constraint(equalToConstant: 60),
            mySecondView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
        }
        
    }
} #endif

// Opt + Command + Enter : 미리보기 창 열기
// Opt + Command + P : 미리보기 활성화
