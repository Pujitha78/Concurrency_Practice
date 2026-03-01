
import Foundation

struct LoginResource {

    func authenticateUser(request: LoginRequest, completion: @escaping(_ result: LoginResponse?)->Void) {
        
        var urlRequest = URLRequest(url: ApiResource.login!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        do {
            let body = try JSONEncoder().encode(request)
            urlRequest.httpBody = body
            urlRequest.addValue("\(body.count)", forHTTPHeaderField: "content-length")
        } catch  {
            debugPrint("encoder error = \(error.localizedDescription)")
        }

        HttpUtility.shared.request(urlRequest: urlRequest, resultType: LoginResponse.self) { (response) in
            completion(response)
        }
    }
}
