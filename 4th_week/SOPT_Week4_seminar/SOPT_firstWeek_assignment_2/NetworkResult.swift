//
//  NetworkResult.swift
//  SOPT_firstWeek_assignment_2
//
//  Created by 송지훈 on 2020/05/15.
//  Copyright © 2020 송지훈. All rights reserved.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
