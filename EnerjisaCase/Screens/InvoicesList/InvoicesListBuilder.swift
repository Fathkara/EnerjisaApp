//
//  InvoicesBuilder.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

class InvoicesListBuilder {
    static func make() -> InvoicesListVC {
        let vc = InvoicesListVC()
        let service = HttpClient()
        let viewModel = InvoicesListViewModel(service: service)
        vc.viewModel = viewModel
        return vc
    }
}
