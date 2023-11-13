//
//  PostGauthDataService.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/11/04.
//

import Foundation
import Alamofire

struct PostGauthDataService {
    static let shared = PostGauthDataService()
    
    func postGauthInfo(code: String, completion : @escaping (NetworkResult<Any>) -> Void) {
        let URL = "https://port-0-stack-knowledge-server-1xxfe2bllyrfbtt.sel5.cloudtype.app/auth"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let param = [
            "code": code
        ]
        print(param)
        let dataRequest = AF.request(URL,
                                     method: .post,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success(_):
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(_):
                completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GauthDataModel.self, from: data) else { return .pathErr}
        
        return .success(decodedData.authority)
    }
}
