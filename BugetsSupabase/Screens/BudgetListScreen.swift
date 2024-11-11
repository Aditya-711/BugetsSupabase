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
    @State private var isPresented: Bool = false
    
    @EnvironmentObject var budgetStore: BudgetStore
    
    private func fetchBudgets() async {
        do {
            budgetStore.budgets = try await supabaseClient
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
                ForEach(budgetStore.budgets) { budget in
                    BudgetCellView(budget: budget)
                }
            }
        .task {
            await fetchBudgets()
        }
        .navigationTitle("Budgets")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add new") {
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                AddBudgetScreen {}
            }
        }
    }
}

#Preview {
    NavigationStack {
       // BudgetListScreen(budgetStore: BudgetStore())
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
