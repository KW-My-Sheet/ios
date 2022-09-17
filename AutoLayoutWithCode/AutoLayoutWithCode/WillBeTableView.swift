//
//  WillBeTableView.swift
//  AutoLayoutWithCode
//
//  Created by 이주송 on 2022/09/17.
//

import UIKit

class WillBeTableView: UIViewController {

    var TestView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // corner radius 전용
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.autoLayout()
    }
    
    func autoLayout() {
        // MARK: - First View
        self.view.addSubview(TestView)
        NSLayoutConstraint.activate([
            TestView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            TestView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            TestView.widthAnchor.constraint(equalToConstant: 100),
            TestView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

#if DEBUG
import SwiftUI
struct WillBeTableView_Representable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        WillBeTableView()
    }
}
@available(iOS 13.0, *)
struct WillBeTableView_Representable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            WillBeTableView_Representable()
                .ignoresSafeArea()
                .previewDisplayName("WillBeTableView")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
        }
        
    }
} #endif

// Opt + Command + Enter : 미리보기 창 열기
// Opt + Command + P : 미리보기 활성화
