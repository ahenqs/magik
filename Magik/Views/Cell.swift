//
//  Cell.swift
//  Magik
//
//  Created by André Henrique da Silva on 25/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var product: Product? {
        didSet {
            guard let prod = product else { return }
            
            configureCell(prod)
        }
    }
    
    var buttonActionHandler: ProductHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        formatCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        // reset cell content here if necessary
    }
    
    private func formatCell() {
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        
        actionButton.layer.cornerRadius = 5.0
        actionButton.layer.masksToBounds = true
        actionButton.layer.borderWidth = 1.0
        actionButton.layer.borderColor = actionButton.titleColor(for: .normal)?.cgColor
    }
    
    private func configureCell(_ model: Product) {
        
        titleLabel.text = model.viewModel.name
        
        actionButton.setTitle("Buy \(model.viewModel.price!)", for: .normal)
        
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        
        guard let prod = product else { return }
        
        buttonActionHandler?(prod)
    }
    
}
