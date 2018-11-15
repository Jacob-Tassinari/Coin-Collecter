//
//  LibraryClass.swift
//  Coin-Collecter
//
//  Created by Jacob Tassinari on 10/29/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

class Library {
    // Singleton!😕
    static let sharedInstance = Library()
    var games = [Game]()
}
