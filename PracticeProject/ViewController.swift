//
//  ViewController.swift
//  PracticeProject
//
//  Created by 이주송 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var stickyHeader: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.delegate = self
    }


}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.ScrollView.contentOffset.y >= 100 {
            print("Sticky Header ON")
        } else {
            print("Sticky Header Off")
        }
//        print(self.ScrollView.contentOffset.y)
    }
}
