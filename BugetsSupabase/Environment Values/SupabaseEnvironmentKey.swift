//
//  SupabaseEnvironmentKey.swift
//  BugetsSupabase
//
//  Created by Aditya Inamdar on 09/11/24.
//

import Foundation
import SwiftUI
import Supabase

struct SupabaseEnvironmentKey: EnvironmentKey {
    static var defaultValue: SupabaseClient = .development
}
//struct ATempEnvironmentKey: EnvironmentKey {
//    static var defaultValue: String = " adada"
//}

extension EnvironmentValues {
    
//    var tempEnvironment: String {
//        get {
//            self[ATempEnvironmentKey.self]
//        }
//        set {
//            self[ATempEnvironmentKey.self] = newValue
//        }
//    }
    var supabaseClient: SupabaseClient {
        get {
            self[SupabaseEnvironmentKey.self]
        }
        set {
            self[SupabaseEnvironmentKey.self] = newValue
        }
    }
}
