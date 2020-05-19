//
//  LoginService.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/05/16.
//  Copyright © 2020 송지훈. All rights reserved.
//

import Foundation
import Alamofire


struct LoginService {
    static let shared = LoginService()
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["id": id, "password": pwd]
    }
    func login(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding:
            JSONEncoding.default, headers: header)
        dataRequest.responseData {
            dataResponse in
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
        case 200: return isUser(by: data)   // 성공
        case 400: return .pathErr           // 요청 경로 에러 --> 보통 개발자의 잘못...
        case 500: return .serverErr         // 서버 에러
        default: return .networkFail
        }
    }
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SigninData.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        return .success(tokenData.jwt)
    }
}





