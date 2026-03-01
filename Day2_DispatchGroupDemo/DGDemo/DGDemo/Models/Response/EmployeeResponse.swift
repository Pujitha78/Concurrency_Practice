
import Foundation

// MARK: - EmployeeResponse
struct EmployeeResponse: Decodable {
    let errorMessage: String?
    let data: [Employee]?
}

// MARK: - Employee
struct Employee: Decodable {
    let name, email, id, joining: String
}
