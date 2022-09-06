//
//  ST_UserProfile.swift
//  PatchTest
//
//  Created by 이주송 on 2022/09/06.
//

import Foundation

// MARK: - EditRequest
struct EditRequest: Codable {
    let userName, profileImgURL: String

    enum CodingKeys: String, CodingKey {
        case userName
        case profileImgURL = "profileImgUrl"
    }
}

// MARK: - EditResponse
struct EditResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_1_4
}

// MARK: - BaseResult
struct BaseResult_1_4: Codable {
    let userIdx: Int
    let userName, profileImgURL, status: String

    enum CodingKeys: String, CodingKey {
        case userIdx, userName
        case profileImgURL = "profileImgUrl"
        case status
    }
}
