//
//  Game.swift
//  Coin-Collecter
//
//  Created by Jacob Tassinari on 10/29/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

class Game {
    let Title:String
    let Description:String
    var DueDate:Date? = nil
    var Availabilty:availabilty = .checkedIn
    let Rating:rating
    let Genre:genre
    enum availabilty{
        case checkedIn
        case checkedOut(DueDate: Date)
    }
    enum rating: String{
        case K = "Kids"
        case E = "Everyone"
        case E10 = "10 and up"
        case T = "Teen"
        case M = "Mature"
    }
    enum genre: String{
        case RPG = "role-playing game"
        case FPS = "First person shooter"
        case RTS = "real time Stateragey"
        case PlatformIng = "platforming"
        case Survival = "survival"
        case TextBased = "Text-Based"
        case MOBA = "Multiplayer Online Battle Arena"
        case StoryFocused = "Story"
        case ActionAdventure = "Action and Adventure"
        case Arcade = "Arcade"
    }
    init(Title:String,Description:String,Rating:rating,Genre:genre) {
        self.Title = Title
        self.Description = Description
        self.Rating = Rating
        self.Genre = Genre
    }
}
