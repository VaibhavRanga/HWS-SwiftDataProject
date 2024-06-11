//
//  EditUserMainView.swift
//  HWS-SwiftDataProject
//
//  Created by Vaibhav Ranga on 08/06/24.
//

import SwiftData
import SwiftUI

struct EditUserMainView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        Text(user.name)
                    }
                }
                .onDelete(perform: deleteUser)
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add user", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
    
    func deleteUser(at offsets: IndexSet) {
        for offset in offsets {
            let user = users[offset]
            modelContext.delete(user)
        }
    }
}

#Preview {
    EditUserMainView()
}
