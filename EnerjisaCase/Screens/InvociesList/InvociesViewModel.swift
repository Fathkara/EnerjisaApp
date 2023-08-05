//
//  InvociesViewModel.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation
protocol InvociesListViewModelProtocol {
    var delegate: InvociesViewModelDelegate? { get set}
    func loadInvocies()
    func getInvocies() -> UserInvoices?
}

enum InvociesListViewModelOutPut {
    case invociesData(UserInvoices)
    case error(String)
}


protocol InvociesViewModelDelegate {
    func handleOutPut(outPut: InvociesListViewModelOutPut)
}

class InvociesListViewModel: InvociesListViewModelProtocol {
    var delegate: InvociesViewModelDelegate?
    var service: HttpClientProtocol?
    var invociesData: UserInvoices?
    
    init(service: HttpClientProtocol) {
        self.service = service
    }
    
}

extension InvociesListViewModel {
    func loadInvocies() {
        service?.fetchAllData(onSuccess: { [delegate] invocies in
            self.invociesData = invocies
            delegate?.handleOutPut(outPut: .invociesData(invocies))
        }, onFailure: { [delegate]  error in
            delegate?.handleOutPut(outPut: .error(error))
        })
    }
    
    func getInvocies() -> UserInvoices? {
        invociesData
    }
}
