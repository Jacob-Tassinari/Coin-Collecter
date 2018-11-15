//
//  AddGameViewController.swift
//  Coin-Collecter
//
//  Created by Jacob Tassinari on 11/7/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var ratingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        trySavingGame()
    }
    
    let segments: [(title: String, rating: Game.rating)] =
        [("K", .K),
         ("E", .E),
         ("E 10+", .E10),
         ("T", .T),
         ("M", .M),]
    
    let genres: [(title: String, genre: Game.genre)] =
        [("Action and Adventure", .ActionAdventure),
         ("Arcade", .Arcade),
         ("Platforming", .PlatformIng),
         ("Survival", .Survival),
         ("Role-Playing Game", .RPG),
         ("Multiplayer Online Battle Arena", .MOBA),
         ("Story focused", .StoryFocused),
         ("Text-Based", .TextBased),
         ("First person shooter", .FPS),
         ("real time Stateragey", .RTS)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingSegmentedControl.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
            ratingSegmentedControl.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        
        ratingSegmentedControl.selectedSegmentIndex = 0
        
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
    }
    
    
    func trySavingGame() {
        
        // title
        guard let title = titleTextField.text else { return }
        
        // details
        guard let details = detailsTextView.text else { return }
        
        // rating
        let rating = segments[ratingSegmentedControl.selectedSegmentIndex].rating
        
        // genre
        let genre = genres[genrePickerView.selectedRow(inComponent: 0)].genre
        
        let game = Game(Title: title, Description: details, Rating: rating, Genre: genre)
        
        Library.sharedInstance.games.append(game)
        
        self.navigationController?.popViewController(animated: true)
    }
}
extension AddGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
    
    
}
