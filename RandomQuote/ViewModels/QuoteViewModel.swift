//
//  QuoteViewModel.swift
//  RandomQuote
//
//  Created by Анастасия Конончук on 17.04.2024.
//

import Foundation

final class QuoteViewModel {
    private(set) var isLoading = false
    
    func fetchQuote(completion: @escaping (Quote) -> Void) {
        isLoading = true
        
        NetworkManager.shared.fetchQuote(
            url: URLExamples.jsonUrl.rawValue
        ) { [weak self] quote in
            completion(quote)
            self?.isLoading = false
        }
    }
}
