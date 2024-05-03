//
//  NetworkManager.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import Foundation

final class NetworkManager : ObservableObject{
    static let shared = NetworkManager()
    let baseURL = "https://api.inopenapp.com/api/v1/dashboardNew"
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
   
    func getResponse() async throws -> Response{
        
        guard let url = URL(string: baseURL)else{
            print("Invalid URL")
            throw NError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let(data , _) = try await URLSession.shared.data(for: request)
//        print("response \(response)")
//        guard let response = response as? HTTPURLResponse , response.statusCode == 200 else
//        {
//            print("Invalid Response \(response)")
//            throw NError.invalidResponse
//        }
       
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
        do{
//            print(String(data: data, encoding: .utf8) ?? "NO data")
            
            let response =  try decoder.decode(Response.self , from: data)
//            print(response)
            return response
        }catch{
            print("invalid Data")
            throw NError.invalidData
        }
        
//            print(String(data: data, encoding: .utf8) ?? "NO data")
//        print("Response = \(response)")
        
        
        
    }
}
