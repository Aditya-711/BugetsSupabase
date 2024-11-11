//
//  Budget.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 10/11/24.
//

import Foundation
struct Budget: Codable, Identifiable {
    var id: Int?
    let name: String
    let limit: Double
}

class BudgetStore: ObservableObject {
    @Published var budgets: [Budget] = []
}
