//
//  ServiceConstant.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

final class ServiceConstant {

    enum serviceConstant: String {
        case baseUrl = "https://raw.githubusercontent.com/"
        case pathUrl = "bydevelopertr/enerjisa/main/"
        case invoicesUrl = "userInvoices.json"
        
        static func invoicesPath() -> String {
            return "\(baseUrl.rawValue)\(pathUrl.rawValue)\(invoicesUrl.rawValue)"
        }
    }
}
