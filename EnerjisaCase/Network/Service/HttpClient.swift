//
//  HttpClient.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation
import Alamofire

protocol HttpClientProtocol {
    func fetchAllData(onSuccess: @escaping (UserInvoices) -> Void,
                      onFailure: @escaping (String) -> Void
    )
}

class HttpClient: HttpClientProtocol {
    
    func fetchAllData(onSuccess: @escaping (UserInvoices) -> Void,
                      onFailure: @escaping (String) -> Void) {
        
        AF.request(ServiceConstant.serviceConstant.invoicesPath(), method: .get).responseDecodable(of: UserInvoices.self) {
            invoices in
            guard let data = invoices.value else {
                return onFailure("Data could not be parsed.")
            }
            onSuccess(data)
        }
    }
}
