//
//  APIResponse.swift
//  sample
//
//  Created by FeedMyTummy on 7/1/21.
//

import Foundation

// Do all of these values need to be nullable? Required values should not be Swift optional types
struct APIResponse: Codable {
    
    let _id: APIID?
    let abQuestion: String?
    let abQuestionDomain: String?
    let abSentence: String?
    let bcQuestion: String?
    let bcQuestionDomain: String?
    let bcSentence: String?
    let imageName: String?
    let numSyll: APINumSyll?
    let photo: String?
    let progName: String?
    let syllStructure: String?
    let theme: String?
    let unit: APIUnit?
    let vocabulary: String?
}

struct APIUnit: Codable {
    
    let numberInt: Int?
    
    private enum CodingKeys: String, CodingKey {
        case numberInt = "$numberInt"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self) // The value is a string in your database
        let value = try values.decode(String.self, forKey: .numberInt)
        numberInt = Int(value)
    }
}

struct APINumSyll: Codable {
    
    let numberInt: Int?
    
    private enum CodingKeys: String, CodingKey {
        case numberInt = "$numberInt"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self) // The value is a string in your database
        let value = try values.decode(String.self, forKey: .numberInt)
        numberInt = Int(value)
    }
}

struct APIID: Codable {
    
    let oid: String
    
    private enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}
