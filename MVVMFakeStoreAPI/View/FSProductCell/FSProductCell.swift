//
//  FSProductCell.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import UIKit
import Kingfisher

class FSProductCell: UITableViewCell {
    
    static let cellID: String = "FSProductCell"
    
    @IBOutlet weak var backGroundView: UIView?
    @IBOutlet weak var productImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var categoryLabel: UILabel?
    @IBOutlet weak var ratingButton: UIButton?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    
    var objc: FSProducts? {
        didSet {
            getCellDetails()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backGroundView?.backgroundColor = .systemGray6
        backGroundView?.layer.cornerRadius = 15
        backGroundView?.clipsToBounds = false
        productImage?.layer.cornerRadius = 10
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    func getCellDetails(){
        titleLabel?.text = objc?.title
        categoryLabel?.text = objc?.category
        ratingButton?.setTitle("\(self.objc?.rating.rate ?? 0.0)", for: .normal)
        descriptionLabel?.text = objc?.description
        priceLabel?.text = "$\(objc?.price ?? 0.0)"
        if let url = URL(string: self.objc?.image ?? "") {
            self.productImage?.kf.setImage(with: url)
        }
    }
    
    
}
