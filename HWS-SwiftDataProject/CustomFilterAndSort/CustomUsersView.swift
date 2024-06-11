//
//  CustomUsersView.swift
//  HWS-SwiftDataProject
//
//  Created by Vaibhav Ranga on 09/06/24.
//

import SwiftData
import SwiftUI

struct CustomUsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                Text(user.name)
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    CustomUsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
}
