//
//  InvoicesDetailViewModel.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

protocol InvoicesDetailViewModelProtocol {
    var view: InvoicesDetailViewModelDelegate? { get set}
    func loadInvoices()
    func getList() -> List?
    func getInvoices() -> Invoice?
}

enum InvoicesDetailOutPut {
    case invoicesListData(List)
    case invoicesData(Invoice)
}

protocol InvoicesDetailViewModelDelegate {
    func handleOutPut(outPut: InvoicesDetailOutPut)
}

class InvoicesDetailViewModel: InvoicesDetailViewModelProtocol {
    var view: InvoicesDetailViewModelDelegate?
    var invoicesListData: List?
    var invoiceData: Invoice?
    var arrInvoice: [Invoice] = []
    
    init(view: InvoicesDetailViewModelDelegate, invoicesListData: List,invoiceData: Invoice,arrInvoice: [Invoice]) {
        self.view = view
        self.invoicesListData = invoicesListData
        self.invoiceData = invoiceData
        self.arrInvoice = arrInvoice
    }
}

extension InvoicesDetailViewModel {
    func loadInvoices() {
        guard let invoicesListData else { return }
        view?.handleOutPut(outPut: .invoicesListData(invoicesListData))
    }
    
    func getList() -> List? {
        invoicesListData
    }
    func getInvoices() -> Invoice? {
        invoiceData
    }
}
