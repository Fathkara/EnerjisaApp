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
        case invociesUrl = "userInvoices.json"
        
        static func invociesPath() -> String {
            return "\(baseUrl.rawValue)\(pathUrl.rawValue)\(invociesUrl.rawValue)"
        }
    }
}
