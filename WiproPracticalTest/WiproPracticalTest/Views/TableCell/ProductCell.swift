//
//  ProductCell.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet var viewProductContent: UIView!
    @IBOutlet var ImageProduct: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelSubTitle: UILabel!
    @IBOutlet var buttonRating: UIButton!
    @IBOutlet var labelDescription: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var buttonBuy: UIButton!
    
    static let identifier = "ProductCell"
    
    var product: Product? {
        didSet {
            configureProductData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewProductContent.layer.masksToBounds = false;
        viewProductContent.layer.cornerRadius = 15
        viewProductContent.backgroundColor = .systemGray6
        
        ImageProduct.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureProductData() {
        guard let product = product else {
            return
        }

        ImageProduct.setImage(with: product.image)
        labelTitle.text = product.title
        labelSubTitle.text = product.category
        buttonRating.setTitle("\(product.ratting?.rate ?? 0.0)", for: .normal)
        labelDescription.text = product.description
        labelPrice.text = "$\(product.price ?? 0.0)"
    }
}
