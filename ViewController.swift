//
//  ViewController.swift
//  Warning
//
//  Created by 이주송 on 2022/09/19.
//

import UIKit
import WebKit
//import GoogleMobileAds

class ViewController: UIViewController {
    
    var PostReserve = postReserve ()
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var addView: UIView!
    
    var roomName: String?
    var webSiteUrl: String?
    var reservedSheetNumber: String?
    //    private var bannerView: GADBannerView!
    
    //MARK: - UI Component Variable
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        return button
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chair"), style: .plain, target: self, action: #selector(buttonPressed(_:)))
        return button
    }()
    
    //MARK: - Main Function
    @objc private func buttonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "자리 예약하기", message: "알림 받으실 자리를 입력해주세요 ex.35", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.keyboardType = .numberPad
        })
        
        let cancel = UIAlertAction(title: "돌아가기", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "예약하기", style: .default) { (ok) in
            if self.roomName == "제 1열람실" {
                if Int(alert.textFields?[0].text ?? "" ) ?? 0 >= 1 && Int(alert.textFields?[0].text ?? "") ?? 0 <= 122 {
                    
                    ReserveRoom.Num = 1
                    ReserveSheet.Num = Int(alert.textFields?[0].text ?? "" )
                    
                    self.PostReserve.reserve(token: UserDevice.Token ?? "", roomNum: ReserveRoom.Num ?? 0 , sheetNum: ReserveSheet.Num ?? 0)
                    
                    self.reserveConfirm()
                } else {
                    self.pleaseCheckSheetNumber()
                }
            }
            
            if self.roomName == "제 2열람실" {
                if Int(alert.textFields?[0].text ?? "" ) ?? 0 >= 1 && Int(alert.textFields?[0].text ?? "") ?? 0 <= 211 {
                    
                    ReserveRoom.Num = 2
                    ReserveSheet.Num = Int(alert.textFields?[0].text ?? "" )
                    
                    self.PostReserve.reserve(token: UserDevice.Token ?? "", roomNum: ReserveRoom.Num ?? 0 , sheetNum: ReserveSheet.Num ?? 0)
                    
                    self.reserveConfirm()
                } else {
                    self.pleaseCheckSheetNumber()
                }
            }
            
            if self.roomName == "제 3열람실" {
                if Int(alert.textFields?[0].text ?? "" ) ?? 0 >= 1 && Int(alert.textFields?[0].text ?? "") ?? 0 <= 165 {
                    
                    ReserveRoom.Num = 3
                    ReserveSheet.Num = Int(alert.textFields?[0].text ?? "" )
                    
                    self.PostReserve.reserve(token: UserDevice.Token ?? "", roomNum: ReserveRoom.Num ?? 0 , sheetNum: ReserveSheet.Num ?? 0)
                    
                    self.reserveConfirm()
                } else {
                    self.pleaseCheckSheetNumber()
                }
            }
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reserveConfirm() {
        let alert = UIAlertController(title: "예약 성공 !", message: "자리가 비워지면 알려드릴게요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel) { (cancel) in
            
            self.pushToResevereDetail()
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func pleaseCheckSheetNumber() {
        let alert = UIAlertController(title: "미등록 좌석", message: "자리를 확인하고 다시 예약해주세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .destructive) { (cancel) in
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushToResevereDetail() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ReserveDetail") as? ReserveDetail else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = self.rightButton
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.rightBarButtonItem?.tintColor = .mainRed
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationItem.title = self.roomName ?? ""
    }
    
    override func loadView() {
        super.loadView()
        
        //        webView = WKWebView()
        //        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.uiDelegate = self
        webView.navigationDelegate = self
        //        self.autoLayoutAddView()
        //        self.view.addSubview(webView)
        //        NSLayoutConstraint.activate([
        //            webView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // x축 위치
        //            webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100), // y축 위치
        //            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        //            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        //            webView.heightAnchor.constraint(equalToConstant: 600)
        //        ])
        if let roomName = roomName, let webSiteUrl = webSiteUrl {
            print(roomName)
            print(webSiteUrl)
        }
    }
    
    //    func autoLayoutAddView() {
    //        bannerView = GADBannerView()
    //        bannerView.translatesAutoresizingMaskIntoConstraints = false
    //        self.view.addSubview(bannerView)
    //        NSLayoutConstraint.activate([
    //            bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // x축 위치
    //            bannerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 100), // y축 위치
    //            bannerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
    //            bannerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    //            bannerView.heightAnchor.constraint(equalToConstant: 100)
    //        ])
    //    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webViewLoad()
        //        self.addAd()
//        self.setupBannerView()
    }
    
    //    func addAd() {
    //        self.addView.layer.cornerRadius = 10
    //        self.addView.clipsToBounds = true // corner radius 전용
    //    }
    
    func webViewLoad() {
        let url = URL(string: self.webSiteUrl ?? "")
        let request = URLRequest(url: url!)
        //self.webView?.allowsBackForwardNavigationGestures = true  //뒤로가기 제스쳐 허용
        webView.configuration.preferences.javaScriptEnabled = true  //자바스크립트 활성화
        webView.load(request)
    }
    
    //MARK: - Google AdMob
    //    private func setupBannerView() {
    //        let adSize = GADAdSizeFromCGSize(CGSize(width: self.view.frame.width, height: 50))
    //        bannerView = GADBannerView(adSize: adSize)
    //
    //        bannerView.backgroundColor = .mainRed
    //        addBannerViewToView(bannerView)
    //
    //        bannerView.adUnitID = "ca-app-pub-5206743694825527/3446024756"
    //        bannerView.rootViewController = self
    //        bannerView.load(GADRequest())
    //        bannerView.delegate = self
    //    }
    //
    //    private func addBannerViewToView(_ bannerView: GADBannerView) {
    //        bannerView.translatesAutoresizingMaskIntoConstraints = false
    //        bannerView.clipsToBounds = true
    //        bannerView.layer.cornerRadius = 7
    //        view.addSubview(bannerView)
    //        view.addConstraints(
    //                [NSLayoutConstraint(item: bannerView,
    //                                    attribute: .bottom,
    //                                    relatedBy: .equal,
    //                                    toItem: view.safeAreaLayoutGuide,
    //                                    attribute: .bottom,
    //                                    multiplier: 1,
    //                                    constant: -20),
    //                 NSLayoutConstraint(item: bannerView,
    //                                    attribute: .leading,
    //                                    relatedBy: .equal,
    //                                    toItem: view,
    //                                    attribute: .leading,
    //                                    multiplier: 1,
    //                                    constant: 10),
    //                 NSLayoutConstraint(item: bannerView,
    //                                    attribute: .trailing,
    //                                    relatedBy: .equal,
    //                                    toItem: view,
    //                                    attribute: .trailing,
    //                                    multiplier: 1,
    //                                    constant: -10)
    //        ])
    //    }
    //}
    
    //MARK: - Extension Admob
    //extension ViewController: GADBannerViewDelegate {
    //    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
    //        print("adViewDidReceiveAd")
    //    }
    //
    //    /// Tells the delegate an ad request failed.
    //    func adView(_ bannerView: GADBannerView,
    //                didFailToReceiveAdWithError error: Error) {
    //        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    //    }
    //
    //    /// Tells the delegate that a full-screen view will be presented in response
    //    /// to the user clicking on an ad.
    //    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
    //        print("adViewWillPresentScreen")
    //    }
    //
    //    /// Tells the delegate that the full-screen view will be dismissed.
    //    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
    //        print("adViewWillDismissScreen")
    //    }
    //
    //    /// Tells the delegate that the full-screen view has been dismissed.
    //    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
    //        print("adViewDidDismissScreen")
    //    }
    //
    //    /// Tells the delegate that a user click will open another app (such as
    //    /// the App Store), backgrounding the current app.
    //    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
    //        print("adViewWillLeaveApplication")
    //    }
    //
}

//MARK: - Extension WebViewDelegate
extension ViewController: WKUIDelegate, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("로드 시작")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("로드 완료")
    }
    
    //모달창 닫힐때 앱 종료현상 방지.
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    //alert 처리
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void){
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in completionHandler() }))
        self.present(alertController, animated: true, completion: nil) }
    
    //confirm 처리
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "취소", style: .default, handler: { (action) in completionHandler(false) }))
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action) in completionHandler(true) }))
        self.present(alertController, animated: true, completion: nil) }
    
    // href="_blank" 처리
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil { webView.load(navigationAction.request) }
        return nil }
}
//
//#if DEBUG
//import SwiftUI
//struct ViewController_Representable: UIViewControllerRepresentable {
//
//    func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        ViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewController_Representable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewController_Representable()
//                .ignoresSafeArea()
//                .previewDisplayName("ViewController")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
//        }
//
//    }
//} #endif
//
//// Opt + Command + Enter : 미리보기 창 열기
//// Opt + Command + P : 미리보기 활성화
