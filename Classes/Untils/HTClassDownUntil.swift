//
//  HTClassDownUntil.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/20.
//

import Foundation
import Moya
import SwiftyJSON

// 第一步
class HTClassDownUntil {
    var var_filePath = ""
    var var_fileName = ""
    var var_localLocation: URL {
        let var_filePath = FileManager.default.temporaryDirectory
        return var_filePath.appendingPathComponent(var_fileName)
    }
    var var_downloadDestination: DownloadDestination {
        return { _, _ in return (self.var_localLocation, [.removePreviousFile, .createIntermediateDirectories]) }
    }
    public func ht_down(var_filePath: String,var_fileName:String, resultSuccess: @escaping (_ result: Bool, _ response: String?,_ error:HTClassModelReqError?) -> Void) {
           self.var_filePath = var_filePath
           self.var_fileName = var_fileName
           let var_networkProvider = MoyaProvider<HTClassDownUntil>()
           var_networkProvider.request(self) { result in
                self.ht_resultData(result: result, resultSuccess: resultSuccess)
            }
    }

    fileprivate func ht_resultData(result: Result<Moya.Response, MoyaError>,resultSuccess: @escaping (_ result: Bool, _ response: String?, _ error:HTClassModelReqError?) -> Void) {
        if case .success( _) = result {
            resultSuccess(true,var_localLocation.path,nil)
        } else {
            resultSuccess(false,nil,HTClassModelReqError(var_code: 500, var_error: ht_AsciiString("Unknow Error")))
        }
    }
}

// 第二部
extension HTClassDownUntil: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return URL(string: var_filePath)!
    }

    var method: Moya.Method {
        return .get
    }

    var path: String {
        return ""
    }
    
    var task: Task {
        return .downloadDestination(var_downloadDestination)
    }
}


