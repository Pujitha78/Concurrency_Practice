

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: User?
}

// MARK: - User
struct User: Decodable {
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
