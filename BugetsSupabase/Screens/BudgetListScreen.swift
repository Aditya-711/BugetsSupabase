//
//  ContentView.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 09/11/24.
//

import SwiftUI

struct BudgetListScreen: View {
    
    @Environment(\.supabaseClient) private var supabaseClient
    @State private var budgets: [Budget] = []
    
    private func fetchBudgets() async {
        do {
            budgets = try await supabaseClient
                .from("budgets")
                .select()
                .execute()
                .value
        } catch {
            print(error)
        }
        
    }
    var body: some View {
        List {
            ForEach(budgets) { budget in
                BudgetCellView(budget: budget)
            }
        }
        .task {
            await fetchBudgets()
        }
        .navigationTitle("Budgets")
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
    }
        //.environment(\.supabaseClient, .development)
}

struct BudgetCellView: View {
    
    let budget: Budget
    var body: some View {
        HStack {
            Text(budget.name)
            Spacer()
            Text(budget.limit, format: .currency(code: Locale.current.currency!.identifier))
        }
    }
}
