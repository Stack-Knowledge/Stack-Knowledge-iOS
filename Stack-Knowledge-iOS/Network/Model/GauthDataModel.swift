//
//  GauthDataModel.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/11/04.
//

import Foundation

struct GauthDataModel: Codable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
    let authority: String
}
