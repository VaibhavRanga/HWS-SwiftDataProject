//
//  AnotherUserView.swift
//  HWS-SwiftDataProject
//
//  Created by Vaibhav Ranga on 09/06/24.
//

import SwiftData
import SwiftUI

struct AnotherUserView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text("\(user.jobs.count)")
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        
        let job1 = Job(name: "Organise sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    AnotherUserView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
}
