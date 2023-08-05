//
//  InvoicesViewModel.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation
protocol InvoicesListViewModelProtocol {
    var delegate: InvoicesViewModelDelegate? { get set}
    func loadInvoices()
    func getInvoices() -> UserInvoices?
}

enum InvoicesListViewModelOutPut {
    case invoicesData(UserInvoices)
    case error(String)
}


protocol InvoicesViewModelDelegate {
    func handleOutPut(outPut: InvoicesListViewModelOutPut)
}

class InvoicesListViewModel: InvoicesListViewModelProtocol {
    var delegate: InvoicesViewModelDelegate?
    var service: HttpClientProtocol?
    var invoicesData: UserInvoices?
    
    init(service: HttpClientProtocol) {
        self.service = service
    }
    
}

extension InvoicesListViewModel {
    func loadInvoices() {
        service?.fetchAllData(onSuccess: { [delegate] invoices in
            self.invoicesData = invoices
            delegate?.handleOutPut(outPut: .invoicesData(invoices))
        }, onFailure: { [delegate]  error in
            delegate?.handleOutPut(outPut: .error(error))
        })
    }
    
    func getInvoices() -> UserInvoices? {
        invoicesData
    }
}
