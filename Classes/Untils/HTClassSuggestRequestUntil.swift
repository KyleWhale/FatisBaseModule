//
//  HTClassAssosiUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/16.
//

import Foundation
import Moya
import SwiftyJSON

class HTClassSuggestRequestUntil {
    fileprivate var var_requestPath: String = ""
    fileprivate var var_requestMethod: Moya.Method = .get
    fileprivate var var_parameters: [String: Any] = [:]
    fileprivate let var_encoding = URLEncoding.default
    init() {
        
    }
    public func ht_request(method: Moya.Method = .get, url: String, parameters: [String: Any] = [:],resultSuccess: @escaping (_ result: Bool, _ response: String?,_ error:HTClassModelReqError?) -> Void) {
           self.var_requestPath = url
           self.var_requestMethod = method
           self.var_parameters = parameters
           let var_networkProvider = MoyaProvider<HTClassSuggestRequestUntil>()
           var_networkProvider.request(self) { result in
               self.ht_resultData(result: result, resultSuccess: resultSuccess)
           }
       }

    fileprivate func ht_resultData(result: Result<Moya.Response, MoyaError>,resultSuccess: @escaping (_ result: Bool, _ response: String?, _ error:HTClassModelReqError?) -> Void) {
           if case .success(let response) = result {
               let string = String(data: response.data, encoding: .utf8)
               resultSuccess(true,string,nil)
          } else {
              resultSuccess(false,nil,HTClassModelReqError(var_code: 500, var_error: ht_AsciiString("Unknow Error")))
          }
       }
}

extension HTClassSuggestRequestUntil:TargetType{
    public var baseURL: URL{
        return URL(string: ht_AsciiString("https://suggestqueries.google.com/"))!
    }

    public var path: String {
        return var_requestPath
    }

    public var method: Moya.Method {
        return var_requestMethod
    }

    public var task: Task {
        return .requestParameters(parameters: var_parameters, encoding: var_encoding)
    }

    public var validate: Bool {
        return false
    }

    public var headers: [String: String]? {
        return [:]
    }
}
