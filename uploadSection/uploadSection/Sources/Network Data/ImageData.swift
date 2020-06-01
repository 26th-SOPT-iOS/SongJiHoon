//
//  ImageData.swift
//  uploadSection
//
//  Created by 송지훈 on 2020/05/31.
//  Copyright © 2020 송지훈. All rights reserved.
//

import Foundation



struct imageData: Codable{
    
    var status: Int
    var success: Bool
    var message: String
    
    
    enum CodingKeys: String, CodingKey{
        case status = "status"
        case success = "success"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""

    }
}


struct TokenData: Codable{
    var jwt: String
}
