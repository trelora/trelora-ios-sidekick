//
//  EnvironmentTableViewCell.swift
//  Sidekick
//
//  Created by Rolly Sarmiento on 11/28/17.
//  Copyright © 2017 Rolly Sarmiento. All rights reserved.
//

import UIKit

class EnvironmentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var apiUrlStringLabel: UILabel!
    @IBOutlet weak var webUrlStringLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        apiUrlStringLabel.isHidden = false
        webUrlStringLabel.isHidden = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(withEnvironment environment: Environment) {
        nameLabel.text = environment.name
        apiUrlStringLabel.text = environment.apiHost
        webUrlStringLabel.text = environment.webHost
        
        apiUrlStringLabel.isHidden = environment.apiHost.isEmpty
        webUrlStringLabel.isHidden = environment.webHost.isEmpty
    }
}
