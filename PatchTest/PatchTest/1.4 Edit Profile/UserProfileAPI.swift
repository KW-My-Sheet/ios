//
//  orderAPI.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import Foundation

// MARK: - [POST] 1.4 프로필 편집
class post_1_4 {
    
    func post_1_4_UserProfile(accessToken:String, userName:String, onCompleted: @escaping (Result<EditResponse,Error>)-> Void) {
            let Testurl = URL(string: "https://prod.jinsoo.shop/app/users/32")!

            var userProfile = EditRequest(userName: userName, profileImgURL: "sa")
            
            guard let jsonData = try? JSONEncoder().encode(userProfile) else {
                print("error: cannot encode data")
                return
            }
            print(jsonData)
            
            var request1 = URLRequest(url: Testurl)
            request1.httpMethod = "PATCH"
            request1.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request1.setValue("application/json", forHTTPHeaderField: "Accept")
            request1.setValue(accessToken, forHTTPHeaderField: "X-ACCESS-TOKEN")

            request1.httpBody = jsonData
            
            
            URLSession.shared.dataTask(with: request1) { (data, response, error) in
                guard error == nil else {
                    print("error at first")
                    print(error)
                    return
                }
                
                guard let data = data else {
                    print("error at data")
                    return
                }
                
                guard let response = response else {
                    print("error at response")
                    return
                }
                
                do { // 요청 O 응답 O
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(EditResponse.self, from: data)
                                        
                    onCompleted(.success(result))
                
                }
                

                catch {
                    print("error while print json")
                    onCompleted(.failure(error))
                }

            }.resume()
        }

}

