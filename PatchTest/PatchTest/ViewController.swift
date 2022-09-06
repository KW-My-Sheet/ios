//
//  ViewController.swift
//  PatchTest
//
//  Created by 이주송 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {

    var Patch = post_1_4 ()
    
    var accessToken = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozMiwiaWF0IjoxNjYxNTc5MzY0LCJleHAiOjE2NjMwNTA1OTN9.Se891bmMjPw8DnWrWdg_gHrzNOJUEvmEFTNTDrwIsqA"
    
    var userIdx = "32"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Patch.post_1_4_UserProfile(accessToken: accessToken, userName: "ssrr23")
    }


}

