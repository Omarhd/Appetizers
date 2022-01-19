//
//  NetworkManager.swift
//  Forgan
//
//  Created by Omar on 25/11/2021.
//

import Foundation

struct NetworkServices {
    
    static let shared = NetworkServices()
    
    private init() {}
    
    
    func getAppetizers(completion: @escaping(Result<[Appetizer],Error>) -> Void) {
        
        request(route: .appetizers, with: .get, completion: completion)
        
    }
    
    /// Function that make our urlSession
    /// - Parameters:
    ///   - route: the end point in api..
    ///   - method: http method
    ///   - parameters: any aditional parameters that needed for rqest
    ///   - completion: to handel our response
    
    
    private func request<T: Decodable>(route: Route,
                                      with method: Method,
                                      parameters: [String : Any]? = nil,
                                      completion: @escaping(Result <T, Error> ) -> Void) {
        
        guard let request = createRequest(route: route, with: method, parameters: parameters) else {
            
            completion(.failure(AppError.invalidUrl))
            return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                
                let responseString = String(data: data, encoding: .utf8) ?? "\(AppError.errorDecoding)"
                print("the response is \n:\(responseString)")
            
            } else if let error = error {
                
                result = .failure(error)
                print("error is \n: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handelResponse(result: result, completion: completion)
            }
            
        }.resume()
    }
    
    
    /// Function to handel our response with generics
    /// - Parameters:
    ///   - result: thr result of response after hhttp request
    ///   - completion: to handel the result
    
    private func handelResponse<T: Decodable>(result: Result<Data, Error>?,
                                            completion: (Result <T, Error> ) -> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            
            return
        }
        
        switch result {
       
        case .success(let date):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(APIResponse<T>.self, from: date) else {
                completion(.failure(AppError.errorDecoding))
                
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    /// a helper fucntion to genrate urlRequest..
    /// - Parameters:
    ///   - route: the end point in baseUrl
    ///   - method: the http method
    ///   - parameters: any info the requierd to pass to server
    /// - Returns: our urlRequest
    
    
    private func createRequest(route: Route,
                               with method: Method,
                               parameters: [String : Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
          
            switch method {
          
            case .get:
                
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: "\($0)", value: "\($1)") }
                
                urlRequest.url = urlComponent?.url
                
            case .post, .put, .delete, .patch:
                
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        
        return urlRequest
    }
}
