//
//  InvociesDetailBuilder.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

class InvociesDetailBuilder {
    static func make(listData: List,invoiceData: Invoice,arrInvoice:[Invoice]) -> InvociesDetailVC {
        let vc = InvociesDetailVC()
        let viewModel = InvociesDetailViewModel(view: vc, invoicesListData: listData, invoiceData: invoiceData, arrInvoice: arrInvoice)
        vc.viewModel = viewModel
        return vc
    }}
