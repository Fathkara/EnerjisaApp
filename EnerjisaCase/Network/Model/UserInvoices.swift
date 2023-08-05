//
//  UserInvoices.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import Foundation

// MARK: - UserInvoices

struct UserInvoices: Codable {
    let totalPrice: String?
    let totalPriceCount: Int?
    let list: [List]?
    var invoices: [Invoice]?
}

// MARK: - Invoice

struct Invoice: Codable {
    let legacyContractAccountNumber, installationNumber, documentNumber, amount: String?
    let currency, dueDate: String?
}

// MARK: - List

struct List: Codable {
    let company, installationNumber, contractAccountNumber, amount: String?
    let address: String?
}
