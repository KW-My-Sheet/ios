// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let checkResponse = try? newJSONDecoder().decode(CheckResponse.self, from: jsonData)

import Foundation

// MARK: - CheckResponse
struct CheckResponse: Codable {
    let id, name: String
    let data: DataClass
    let endDate, lastModifiedBy: JSONNull?
    let priority: Int
    let repeatInterval: String
    let repeatTimezone: JSONNull?
    let shouldSaveResult: Bool
    let skipDays, startDate, lockedAt: JSONNull?
    let lastRunAt, lastFinishedAt, type, nextRunAt: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, data, endDate, lastModifiedBy, priority, repeatInterval, repeatTimezone, shouldSaveResult, skipDays, startDate, lockedAt, lastRunAt, lastFinishedAt, type, nextRunAt
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let token: String
    let roomNum, sheetNum: Int

    enum CodingKeys: String, CodingKey {
        case token
        case roomNum = "room_num"
        case sheetNum = "sheet_num"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

