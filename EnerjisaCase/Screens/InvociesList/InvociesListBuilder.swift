//
//  InvociesBuilder.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

class InvociesListBuilder {
    static func make() -> InvociesListVC {
        let vc = InvociesListVC()
        let service = HttpClient()
        let viewModel = InvociesListViewModel(service: service)
        vc.viewModel = viewModel
        return vc
    }
}
