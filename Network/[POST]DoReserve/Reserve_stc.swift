//
//  Reserve_stc.swift
//  Warning
//
//  Created by 이주송 on 2022/09/25.
//

import Foundation

// MARK: - ReserveRequest
struct ReserveRequest: Codable {
    let token: String
    let roomNum, sheetNum: Int

    enum CodingKeys: String, CodingKey {
        case token
        case roomNum = "room_num"
        case sheetNum = "sheet_num"
    }
}

// MARK: - ReserveResponse
struct ReserveResponse: Codable {
    let isSuccess: Bool
}
