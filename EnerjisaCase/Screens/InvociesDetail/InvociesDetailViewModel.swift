//
//  InvociesDetailViewModel.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

protocol InvociesDetailViewModelProtocol {
    var view: InvociesDetailViewModelDelegate? { get set}
    func loadInvoices()
    func getList() -> List?
    func getInvoices() -> Invoice?
}

enum InvociesDetailOutPut {
    case invoicesListData(List)
    case invoicesData(Invoice)
}

protocol InvociesDetailViewModelDelegate {
    func handleOutPut(outPut: InvociesDetailOutPut)
}

class InvociesDetailViewModel: InvociesDetailViewModelProtocol {
    var view: InvociesDetailViewModelDelegate?
    var invoicesListData: List?
    var invoiceData: Invoice?
    var arrInvoice: [Invoice] = []
    
    init(view: InvociesDetailViewModelDelegate, invoicesListData: List,invoiceData: Invoice,arrInvoice: [Invoice]) {
        self.view = view
        self.invoicesListData = invoicesListData
        self.invoiceData = invoiceData
        self.arrInvoice = arrInvoice
    }
}

extension InvociesDetailViewModel {
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
