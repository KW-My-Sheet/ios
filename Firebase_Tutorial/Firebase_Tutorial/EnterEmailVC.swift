//
//  EnterEmailVC.swift
//  Firebase
//
//  Created by 이주송 on 2022/09/09.
//

import UIKit
import FirebaseAuth

class EnterEmailVC: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 30
        
        nextButton.isEnabled = false

        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        
        EmailTextField.becomeFirstResponder()
        // 커서 바로 이메일로 두도록.
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let email = EmailTextField.text ?? ""
        let password = PasswordTextField.text ?? ""
        
        // 신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            // 순환참조 방지
            self.showMainViewController()
            // 로그인 끝났을 때 Show로 화면 이동
        }
    }
    
    private func showMainViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainVC = storyBoard.instantiateViewController(identifier: "MainVC")
        mainVC.modalPresentationStyle = .fullScreen
        navigationController?.show(mainVC, sender: nil)
    }
    
}

extension EnterEmailVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = EmailTextField.text == ""
        let isPasswordEmpty = PasswordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}

// Root View -> Show 하면 Nav로 연결된 VC들은 자연스럽게 Push 됨
// Propotial로 Y축 설정하기
// foreach로 각각의 속성 변경하기
// TextField - Keyboard Type - Email Address
// TextField - Secure Text
// TextField Delegate - shouldReturn: 입력완료 후 내려가게
// TextField becomeFirstResponder 커서 초기화
// AutoLayout 새로고침 버튼
// Label 0으로 하면 유동적으로 변경
// 로그아웃 - popToRootViewController (RootVC가 어딘지 수시로 확인 가능)
