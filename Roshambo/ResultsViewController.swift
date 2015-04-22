//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/18/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultsImageView: UIImageView!
    @IBOutlet weak var humanPlayersChoiceLabel: UILabel!
    @IBOutlet weak var computerPlayersChoiceLabel: UILabel!
    @IBOutlet weak var whoWonLabel: UILabel!
    
    var matchResult: MatchResult!
    let whoWonEnumToNaturalLanguageTranslation = [WhoWon.Computer: "Computer wins!", WhoWon.Human: "You win!"]
    
    private func paperCoversRock(whoWon: WhoWon) {
        matchResult.whoWon = whoWon
        matchResult.whoWonResult = "Paper covers rock. \(whoWonEnumToNaturalLanguageTranslation[whoWon]!)"
        matchResult.imageName = "PaperCoversRock"
    }
    
    private func rockCrushesScissors(whoWon: WhoWon) {
        matchResult.whoWon = whoWon
        matchResult.whoWonResult = "Rock crushes scissors. \(whoWonEnumToNaturalLanguageTranslation[whoWon]!)"
        matchResult.imageName = "RockCrushesScissors"
    }
    
    private func scissorsCutPaper(whoWon: WhoWon) {
        matchResult.whoWon = whoWon
        matchResult.whoWonResult = "Scissors cut paper. \(whoWonEnumToNaturalLanguageTranslation[whoWon]!)"
        matchResult.imageName = "ScissorsCutPaper"
    }
    
    private func playGame() {
        let humanPlayersChoice = self.matchResult.humanPlayersChoice
        let computerPlayersChoice = self.matchResult.computerPlayersChoice
        
        humanPlayersChoiceLabel.text = "You chose: \(humanPlayersChoice)"
        computerPlayersChoiceLabel.text = "Computer chose: \(computerPlayersChoice)"
        
        switch humanPlayersChoice {
        case "rock" where computerPlayersChoice == "paper":
            paperCoversRock(WhoWon.Computer)
        case "rock" where computerPlayersChoice == "scissor":
            rockCrushesScissors(WhoWon.Human)
        case "paper" where computerPlayersChoice == "rock":
            paperCoversRock(WhoWon.Human)
        case "paper" where computerPlayersChoice == "scissor":
            scissorsCutPaper(WhoWon.Computer)
        case "scissor" where computerPlayersChoice == "rock":
            rockCrushesScissors(WhoWon.Computer)
        case "scissor" where computerPlayersChoice == "paper":
            scissorsCutPaper(WhoWon.Human)
        default:
            matchResult.whoWon = WhoWon.Tie
            matchResult.whoWonResult = "It's a tie!"
            matchResult.imageName = "itsATie"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        playGame()
        
        var image: UIImage!
        whoWonLabel.text = matchResult.whoWonResult
        resultsImageView.image = UIImage(named: matchResult.imageName)
    }

    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
