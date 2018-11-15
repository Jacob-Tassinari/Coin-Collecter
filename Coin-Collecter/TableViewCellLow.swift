//
//  TableViewCellLow.swift
//  Coin-Collecter
//
//  Created by Jacob Tassinari on 11/7/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class TableViewCellLow: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var Genre: UILabel!
    @IBOutlet var Date: UILabel!
    @IBOutlet var Rating: UILabel!
    @IBOutlet var View: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func SetUP(_ type:Game){
        title.text = type.Title
        Genre.text = type.Genre.rawValue
        Rating.text = type.Rating.rawValue
        switch type.Availabilty {
        case .checkedIn:
            // hide due date
            Date.isHidden = true
            // set view to green
            View.backgroundColor = .green
            
        case .checkedOut(let date):
            // show due date
            Date.isHidden = false
            // set view to red
            View.backgroundColor = .red
            // set dueDate to formatted date
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            Date.text = dateFormatter.string(from: date)
        }
    }
}
