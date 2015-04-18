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
    
    var humanPlayersChoice: String?
    var computerPlayersChoice: String?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var image: UIImage!
        
        if let humanPlayersChoice = self.humanPlayersChoice {
            humanPlayersChoiceLabel.text = "You chose: \(humanPlayersChoice)"
            if let computerPlayersChoice = self.computerPlayersChoice {
                computerPlayersChoiceLabel.text = "Computer chose: \(computerPlayersChoice)"
                
                switch humanPlayersChoice {
                case "rock":
                    switch computerPlayersChoice {
                    case "paper":
                        whoWonLabel.text = "Paper covers rock. Computer wins!"
                        image = UIImage(named: "PaperCoversRock")
                    case "scissor":
                        whoWonLabel.text = "Rock crushes scissors. You win!"
                        image = UIImage(named: "RockCrushesScissors")
                    default:
                        whoWonLabel.text = "It's a tie!"
                        image = UIImage(named: "itsATie")
                    }
                case "paper":
                    switch computerPlayersChoice {
                    case "rock":
                        whoWonLabel.text = "Paper covers rock. You win!"
                        image = UIImage(named: "PaperCoversRock")
                    case "scissor":
                        whoWonLabel.text = "Scissors cut paper. Computer wins!"
                        image = UIImage(named: "ScissorsCutPaper")
                    default:
                        whoWonLabel.text = "It's a tie!"
                        image = UIImage(named: "itsATie")
                    }
                case "scissor":
                    switch computerPlayersChoice {
                    case "rock":
                        whoWonLabel.text = "Rock crushes scissors. Computer wins!"
                        image = UIImage(named: "RockCrushesScissors")
                    case "paper":
                        whoWonLabel.text = "Scissors cut paper. You win!"
                        image = UIImage(named: "ScissorsCutPaper")
                    default:
                        whoWonLabel.text = "It's a tie!"
                        image = UIImage(named: "itsATie")
                        
                    }
                default:
                    break;
                }
                resultsImageView.image = image
            }
        }        
    }

    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
