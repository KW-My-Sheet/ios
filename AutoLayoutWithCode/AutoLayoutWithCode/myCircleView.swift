//
//  myCircleView.swift
//  AutoLayoutWithCode
//
//  Created by 이주송 on 2022/09/16.
//

import Foundation
import UIKit

class MyCircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView의 layoutSubviews가 호출되었습니다.")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
