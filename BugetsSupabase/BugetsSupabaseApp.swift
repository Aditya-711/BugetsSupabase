//
//  BugetsSupabaseApp.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 09/11/24.
//

import SwiftUI
import Supabase

@main
struct BugetsSupabaseApp: App {
    
    
   
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BudgetListScreen()
                    
            }
        }
    }
}
