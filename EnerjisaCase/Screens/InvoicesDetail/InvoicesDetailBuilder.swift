//
//  InvoicesDetailBuilder.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

class InvoicesDetailBuilder {
    static func make(listData: List,invoiceData: Invoice,arrInvoice:[Invoice]) -> InvoicesDetailVC {
        let vc = InvoicesDetailVC()
        let viewModel = InvoicesDetailViewModel(view: vc, invoicesListData: listData, invoiceData: invoiceData, arrInvoice: arrInvoice)
        vc.viewModel = viewModel
        return vc
    }}
