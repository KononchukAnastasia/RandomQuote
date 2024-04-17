//
//  NetworkManager.swift
//  RandomQuote
//
//  Created by Анастасия Конончук on 17.04.2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: Public Methods
    
    func fetchQuote(url: String, completion: @escaping (_ quote: Quote) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                
                DispatchQueue.main.async {
                    completion(quote)
                }
            } catch {
                print("JSON Decoding Error: \(error.localizedDescription)")
                
            }
        }.resume()
    }
}
