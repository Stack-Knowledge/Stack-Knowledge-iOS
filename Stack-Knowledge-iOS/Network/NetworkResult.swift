//
//  NetworkResult.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/11/01.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
