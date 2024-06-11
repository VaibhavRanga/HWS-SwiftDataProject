//
//  Job.swift
//  HWS-SwiftDataProject
//
//  Created by Vaibhav Ranga on 09/06/24.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    @Relationship(deleteRule: .cascade) var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
