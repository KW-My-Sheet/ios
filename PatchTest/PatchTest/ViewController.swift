//
//  ViewController.swift
//  PatchTest
//
//  Created by 이주송 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var Patch = post_1_4 ()
    
    var accessToken = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozMiwiaWF0IjoxNjYxNTc5MzY0LCJleHAiOjE2NjMwNTA1OTN9.Se891bmMjPw8DnWrWdg_gHrzNOJUEvmEFTNTDrwIsqA"
    
    var userIdx = "32"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func GiveMeTheUpdated(_ sender: Any) {
        var NameChanging = self.textField.text ?? ""
        
        self.Patch.post_1_4_UserProfile(accessToken: accessToken, userName: NameChanging, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
    
            switch result {
            case let .success(result):
            
                print(result.baseResult.userName)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
            })
    
    }

}

