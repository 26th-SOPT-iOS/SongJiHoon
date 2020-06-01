//
//  UploadService.swift
//  uploadSection
//
//  Created by 송지훈 on 2020/05/31.
//  Copyright © 2020 송지훈. All rights reserved.
//

import Foundation
import Alamofire


struct UploadService {
    static let shared = UploadService()
    private func makeParameter(_ category: String, _ imgURL: String, _ context : String) -> Parameters {
        return ["category": category, "imgURL": imgURL, "context": context]
    }
    func upload(category: String, imgURL: String, context: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(category, imgURL,context), encoding:
            JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isUser(by data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(imageData.self, from: data) else { return .pathErr }
            if decodedData.success {return .success(decodedData.message)}
            else { return .requestErr(decodedData.message)}
        }
        
    }

