//
//  ViewController.swift
//  newAutoLayout
//
//  Created by 이주송 on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        // 필수 !
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        // View(최상단 뷰)의 하위 뷰에 추가할 것이다.
        
        // x축, y축의 위치 , 뷰의 크기(가로 및 세로)
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true // x축 위치
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true // y축 위치
        
        myFirstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        myFirstView.layer.cornerRadius = 30
    }


}

// Swift UI 프리뷰 제공 메소드

// 전처리기

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
