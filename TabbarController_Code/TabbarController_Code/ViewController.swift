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
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        button.backgroundColor = .white
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: button 눌렀을 때 Present로 띄우기
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        // MARK: Tabbar Controller에 들어갈 ViewControlloers 정의하기(각각 Navi - Root VC임)
        let tabbarController = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())

        // MARK: 각 ViewControllers들의 Navigation Title
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Setting"
        
        tabbarController.setViewControllers([vc1,vc2,vc3], animated: false)
        
        // MARK: Tabbar Item들의 title과 image 넣는 과정 
        guard let items = tabbarController.tabBar.items else {
            return
        }
        
        let images = ["house","bell","gear"]
        
        for i in 0..<items.count {
            items[i].badgeValue = "1"
            items[i].image = UIImage(systemName: images[i])
        }
        
//      navigationController?.pushViewController(tabbarController, animated: true)
        tabbarController.modalPresentationStyle = .fullScreen
        present(tabbarController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.autoLayout()
    }
    
}


class FirstViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Home"
    }
}

class SecondViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Contact"
    }
}

class ThirdViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Setting"
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
/* 4. Scene Delegate 수정
 func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windonScene = (scene as? UIWindowScene) else {return}
        
        window = UIWindow(windowScene: windonScene) // or window?.windowScene = windonScene
        
        let rootVC = ViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        self.window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
*/

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
