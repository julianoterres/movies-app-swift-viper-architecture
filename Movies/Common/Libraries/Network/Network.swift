//
//  Network.swift
//  Movies
//
//  Created by Juliano Terres on 03/05/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

class Network: NetworkProtocol {
  
  func request(url: URL, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    print("->START REQUEST:(\(method.rawValue))\n\(url.absoluteString)\n")
    Alamofire.request(url, method: method, parameters: parameters).validate().responseJSON(completionHandler: { response in
      self.logAlamofireRequest(response: response)
      switch response.result {
      case .success:
        if let data = response.data {
          success(data)
        }
      case .failure(let error):
        failure(error.localizedDescription)
      }
    })
  }
  
  private func logAlamofireRequest(response: DataResponse<Any>) {
    guard let request = response.request else { return }
    guard let url = request.url else { return }
    guard let httpMethod = request.httpMethod else { return }
    
    print("->REQUEST(\(httpMethod))\n\(url)\n")
    
    if let requestHeaders = request.allHTTPHeaderFields, !requestHeaders.isEmpty {
      print("->HEADERS\n\(requestHeaders)\n")
    }
    
    if let httpBody = request.httpBody {
      do {
        let jsonBody = try JSONSerialization.jsonObject(with: httpBody)
        print("->BODY\n")
        print(String(data: try! JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted), encoding: .utf8)!)
        print("\n")
      } catch {
        print("Error in the print of the body")
      }
    }
    
    if let responseData = response.response {
      let statusCode = responseData.statusCode
      let statusCodeString = (statusCode != 0) ? "(\(statusCode))" : ""
      print("->RESPONSE" + statusCodeString)
    }
    
    if let values = response.result.value {
      print(String(data: try! JSONSerialization.data(withJSONObject: values, options: .prettyPrinted), encoding: .utf8)!)
    }
  }
  
}


