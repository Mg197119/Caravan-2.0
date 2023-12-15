//
//  ProfileData.swift
//  Caravan
//
//  Created by Mason Gill on 12/17/23.
//

import Foundation

struct User: Codable {
    var displayName: String
    var prefersDarkMode: Bool
    var favoriteColor: String
    var age: Int
}

func saveUserData(_ user: User) {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent("UserData.json")

    do {
        let data = try JSONEncoder().encode(user)
        try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
    } catch {
        print("Error saving user data: \(error)")
    }
}


func loadUserData() -> User? {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent("UserData.json")

    do {
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(User.self, from: data)
    } catch {
        print("Error loading user data: \(error)")
        return nil
    }
}

