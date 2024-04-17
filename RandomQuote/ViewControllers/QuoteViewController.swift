//
//  QuoteViewController.swift
//  RandomQuote
//
//  Created by Анастасия Конончук on 17.04.2024.
//

import UIKit

final class QuoteViewController: UIViewController {
    @IBOutlet private var quoteLabel: UILabel!
    @IBOutlet private var randomQuoteButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private let quoteViewModel = QuoteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        quoteLabel.layer.cornerRadius = 8
        randomQuoteButton.layer.cornerRadius = 8
    }

    @IBAction private func randomQuoteButtonPressed() {
        activityIndicator.startAnimating()
        quoteLabel.isHidden = !quoteViewModel.isLoading
        
        quoteViewModel.fetchQuote() { [weak self] quote in
            guard let self = self else { return }
            
            self.quoteLabel.text = quote.quoteText
            self.activityIndicator.stopAnimating()
            self.quoteLabel.isHidden = !self.quoteViewModel.isLoading
        }
    }
}
