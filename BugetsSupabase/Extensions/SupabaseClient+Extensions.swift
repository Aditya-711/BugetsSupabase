//
//  SupabaseClient+Extensions.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 09/11/24.
//

import Foundation
import Supabase
extension SupabaseClient {
    
    static var development: SupabaseClient {
        SupabaseClient(supabaseURL: URL(string: "https://yyrkfrdvfhgbpkzggvsw.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5cmtmcmR2ZmhnYnBremdndnN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzExMzkyNTIsImV4cCI6MjA0NjcxNTI1Mn0.VSYI6JyOmytBfb6X2JtRBHaQwCfRid4PQvfYhgbPQRU")
        
    }
}
