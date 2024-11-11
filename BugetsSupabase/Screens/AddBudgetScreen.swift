//
//  AddBudgetScreen.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 10/11/24.
//

import Foundation
import SwiftUI
import Supabase

struct AddBudgetScreen: View {
    
    @State private var name: String = ""
    @State private var limit: Double = 0
    @Environment(\.dismiss) private var dismiss
    @Environment(\.supabaseClient) private var supabaseClient
    
    @EnvironmentObject var budgetStore: BudgetStore
    
    private func save() async {
        let budget = Budget(name: name, limit: limit)
        do {
            try await supabaseClient
                .from("budgets")
                .insert(budget)
                .execute()
            budgetStore.budgets.append(budget)
        } catch {
            print(error)
        }
    }
    let onSave: ()->Void 
    
    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            TextField("Enter  limit", value: $limit, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close", role: .cancel) {
                    dismiss.callAsFunction()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    Task {
                        await save()
                        //onSave() // more better method would be to pass new budget inside this closure and in BudgetListScreen access it and append it to budgets[]
                        dismiss()
                    }
                   
                }
            }
        }
        .navigationTitle("Add Budget")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddBudgetScreen(onSave: {})
    }
}
/* for passing the new budget to the budget screen there are multiple options
 Option 1. Use closure in AddBudgetScreen as below:
    let onSave: (Budget)->Void
    onSave(budget)
    and in BudgetListScreen access this budget and append it to budgets[]
    AddBudgetScreen { budget in
        budgets.append(budget)
    }
 
 Option 2. Use @Binding
    In BudgetAddScreen() add
    @Binding var budgets: [Budget]
    budgets.append(budget)
 
    In BudgetListScreen() pass the budgets[]
    AddBudgetScreen(budgets: $budgets)
 
 Option 3. Use
*/

