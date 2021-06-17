//
//  AccountsCell.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 22/05/21.
//

import UIKit

class AccountsCell: UITableViewCell {

    //MARK: - @IBOutlets
    @IBOutlet weak var balanceLabel: UILabel!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    private func setView() {
        balanceLabel.attributedText = "$300.00".priceStyle(fontSize: 15.0, weight: .light)
    }
    
}
