//
//  History.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/22/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import Foundation

class MatchResult: NSObject {
    let humanPlayersChoice: String
    let computerPlayersChoice: String
    var whoWon: WhoWon!
    var whoWonResult: String!
    var imageName: String!
    
    init(humanPlayersChoice: String, computerPlayersChoice: String) {
        self.humanPlayersChoice = humanPlayersChoice
        self.computerPlayersChoice = computerPlayersChoice
    }

}

enum WhoWon {
    case Human
    case Computer
    case Tie
}