//
//  SignupService.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/05/16.
//  Copyright © 2020 송지훈. All rights reserved.
//

import Foundation
import Alamofire


struct SignupService {
    static let shared = SignupService()
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters {
        return ["id": id, "password": pwd, "name" : name,"email": email, "phone" : phone ]
    }
    func login(id: String, pwd: String, email:String, name : String, phone: String,completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd,name,email,phone), encoding:
            JSONEncoding.default, headers: header)
        
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, data)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isSignUp(by: data)   // 성공
        case 400: return .pathErr           // 요청 경로 에러 --> 보통 개발자의 잘못...
        case 500: return .serverErr         // 서버 에러
        default: return .networkFail
        }
    }
    
    private func isSignUp(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data) else { return .pathErr }
        if decodedData.success {return .success(decodedData.message)}
        else { return .requestErr(decodedData.message)}
    }
    

}
