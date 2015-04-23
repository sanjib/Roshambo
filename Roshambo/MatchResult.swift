//
//  History.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/22/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import Foundation

class MatchResult {
    let humanPlayersChoice: String
    let computerPlayersChoice: String
    var whoWon: WhoWon!
    var whoWonResult: String!
    var whoWonMessage : String {
        if whoWon == WhoWon.Computer {
            return "Computer wins!"
        } else {
            return "You win!"
        }
    }
    var imageName: String!
    
    init(humanPlayersChoice: String, computerPlayersChoice: String) {
        self.humanPlayersChoice = humanPlayersChoice
        self.computerPlayersChoice = computerPlayersChoice
        
        switch humanPlayersChoice {
        case "rock" where computerPlayersChoice == "paper":
            paperCoversRock(.Computer)
        case "rock" where computerPlayersChoice == "scissor":
            rockCrushesScissors(.Human)
        case "paper" where computerPlayersChoice == "rock":
            paperCoversRock(.Human)
        case "paper" where computerPlayersChoice == "scissor":
            scissorsCutPaper(.Computer)
        case "scissor" where computerPlayersChoice == "rock":
            rockCrushesScissors(.Computer)
        case "scissor" where computerPlayersChoice == "paper":
            scissorsCutPaper(.Human)
        default:
            whoWon = .Tie
            whoWonResult = "It's a tie!"
            imageName = "itsATie"
        }
    }
    
    private func paperCoversRock(whoWon: WhoWon) {
        self.whoWon = whoWon
        whoWonResult = "Paper covers rock. \(whoWonMessage)"
        imageName = "PaperCoversRock"
    }
    
    private func rockCrushesScissors(whoWon: WhoWon) {
        self.whoWon = whoWon
        whoWonResult = "Rock crushes scissors. \(whoWonMessage)"
        imageName = "RockCrushesScissors"
    }
    
    private func scissorsCutPaper(whoWon: WhoWon) {
        self.whoWon = whoWon
        whoWonResult = "Scissors cut paper. \(whoWonMessage)"
        imageName = "ScissorsCutPaper"
    }
}

enum WhoWon {
    case Human, Computer, Tie
}
