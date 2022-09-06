//
//  orderAPI.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import Foundation

// MARK: - [POST] 12.3 거래 등록 /orders
class post_1_4 {
    
    func post_1_4_UserProfile(accessToken:String, userName:String) {
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
                    // json 객체에서 data 유형의 인스턴스로 디코딩하는 객체! Decodable, Codable 프로토콜을 준수하는 라인!
                    let result = try decoder.decode(EditResponse.self, from: data)
                    
                    print(result)
                    
                }
                

                catch {
                    print("error while print json")
                }

            }.resume()
        }

}

