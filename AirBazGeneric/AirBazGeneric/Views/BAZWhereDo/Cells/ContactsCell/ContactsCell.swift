//
//  ContactsCell.swift
//  AirBazGeneric
//
//  Created by Branchbit on 21/05/21.
//

import UIKit

class ContactsCell: UITableViewCell {

    //MARK: - @IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
