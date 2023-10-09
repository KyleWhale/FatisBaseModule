//
//  HTClassModelUser.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/12.
//

class HTClassModelUser:HTClassModelUserLogin {
    var var_phone:String = ""
    var var_user_face:String = ""
    var var_user_birth:String = ""
    var var_user_gender:Int64 = 0
    var var_gender:Int64 = 0
    var var_email:String = ""
    var var_msync:String = ""
    var var_user_name:String = ""
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        mapper <<< self.var_phone <-- ht_AsciiString("phone")
        mapper <<< self.var_user_face <-- ht_AsciiString("user_face")
        mapper <<< self.var_user_birth <-- ht_AsciiString("user_birth")
        mapper <<< self.var_user_gender <-- ht_AsciiString("user_gender")
        mapper <<< self.var_gender <-- ht_AsciiString("gender")
        mapper <<< self.var_email <-- ht_AsciiString("email")
        mapper <<< self.var_msync <-- ht_AsciiString("msync")
        mapper <<< self.var_user_name <-- ht_AsciiString("user_name")
    }
}
