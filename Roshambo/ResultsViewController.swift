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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var image: UIImage!
        
        let humanPlayersChoice = self.matchResult.humanPlayersChoice
        let computerPlayersChoice = self.matchResult.computerPlayersChoice
        
        humanPlayersChoiceLabel.text = "You chose: \(humanPlayersChoice)"
        computerPlayersChoiceLabel.text = "Computer chose: \(computerPlayersChoice)"
        
        switch humanPlayersChoice {
        case "rock":
            switch computerPlayersChoice {
            case "paper":
                matchResult.whoWon = "Paper covers rock. Computer wins!"
                matchResult.imageName = "PaperCoversRock"
            case "scissor":
                matchResult.whoWon = "Rock crushes scissors. You win!"
                matchResult.imageName = "RockCrushesScissors"
            default:
                matchResult.whoWon = "It's a tie!"
                matchResult.imageName = "itsATie"
            }
        case "paper":
            switch computerPlayersChoice {
            case "rock":
                matchResult.whoWon = "Paper covers rock. You win!"
                matchResult.imageName = "PaperCoversRock"
            case "scissor":
                matchResult.whoWon = "Scissors cut paper. Computer wins!"
                matchResult.imageName = "ScissorsCutPaper"
            default:
                matchResult.whoWon = "It's a tie!"
                matchResult.imageName = "itsATie"
            }
        case "scissor":
            switch computerPlayersChoice {
            case "rock":
                matchResult.whoWon = "Rock crushes scissors. Computer wins!"
                matchResult.imageName = "RockCrushesScissors"
            case "paper":
                matchResult.whoWon = "Scissors cut paper. You win!"
                matchResult.imageName = "ScissorsCutPaper"
            default:
                matchResult.whoWon = "It's a tie!"
                matchResult.imageName = "itsATie"
            }
        default:
            break;
        }
        whoWonLabel.text = matchResult.whoWon
        resultsImageView.image = UIImage(named: matchResult.imageName)
        
    }

    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
