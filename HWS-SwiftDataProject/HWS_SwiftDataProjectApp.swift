//
//  HWS_SwiftDataProjectApp.swift
//  HWS-SwiftDataProject
//
//  Created by Vaibhav Ranga on 08/06/24.
//

import SwiftData
import SwiftUI

@main
struct HWS_SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
