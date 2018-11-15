//
//  LibraryViewController.swift
//  Coin-Collecter
//
//  Created by Jacob Tassinari on 10/29/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var firstLoad:Bool = true
    let library = Library.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        library.games.append(Game(Title: "SpiderMan", Description: "It makes you feel like spider man. -everyone who played it.", Rating: .T, Genre: .ActionAdventure))
        firstLoad = false
        tableView.reloadData()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func checkOut(indexPath: IndexPath) {
        let game = library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.Availabilty = .checkedOut(DueDate: dueDate)
        
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCellLow {
            cell.SetUP(game)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func checkIn(indexPath: IndexPath) {
        let game = library.games[indexPath.row]
        game.Availabilty = .checkedIn
        
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCellLow {
            cell.SetUP(game)
        }
    }
}

extension LibraryViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my cell", for: indexPath) as! TableViewCellLow
        let game = library.games[indexPath.row]
        cell.SetUP(game)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if Library.sharedInstance.games.count == 0 {
                tableView.reloadData()
            }
        }
        
        let game = library.games[indexPath.row]
        
        switch game.Availabilty {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                self.checkOut(indexPath: indexPath)
            }
            
            return [deleteAction, checkOutAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(indexPath: indexPath)
            }
            return [deleteAction, checkInAction]
        }
    }
    
}
