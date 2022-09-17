//
//  WillBeTableView.swift
//  AutoLayoutWithCode
//
//  Created by 이주송 on 2022/09/17.
//

import UIKit

class WillBeTableView: UIViewController {

    let refresh = UIRefreshControl()

    var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        // 따로 Cell 안만들고 Default Cell 등록해주기
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let items: [String] = ["한꼬마", "두꼬마", "세꼬마"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.autoLayout()
        self.initRefresh()
    }

}

//MARK: - AutoLayout
extension WillBeTableView {
    func autoLayout() {
        self.view.addSubview(self.myTableView)
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
}

//MARK: - Refresh Control
extension WillBeTableView {
    func initRefresh() {
        refresh.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        refresh.backgroundColor = UIColor.clear
        self.myTableView.refreshControl = refresh
    }
 
    @objc func refreshTable(refresh: UIRefreshControl) {
        print("refreshTable")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.myTableView.reloadData()
            refresh.endRefreshing()
        }
    }
    
    //MARK:  UIRefreshControl of ScrollView
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y < -0.1) {
            self.refreshTable(refresh: self.refresh)
        }
    }
}

//MARK: - TableView Delegate
extension WillBeTableView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
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
