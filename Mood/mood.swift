//
//  mood.swift
//  Mood
//
//  Created by Mac14 on 2025/5/20.
//

import SwiftUI
//import Foundation

struct mood: Identifiable, Codable,Equatable{
    var id = UUID()
    var moodText: String
    var imageName: String
    var date: Date
}
    
