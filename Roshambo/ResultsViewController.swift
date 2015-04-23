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
        
        humanPlayersChoiceLabel.text = "You chose: \(matchResult.humanPlayersChoice)"
        computerPlayersChoiceLabel.text = "Computer chose: \(matchResult.computerPlayersChoice)"
        
        var image: UIImage!
        whoWonLabel.text = matchResult.whoWonResult
        resultsImageView.image = UIImage(named: matchResult.imageName)
    }

    @IBAction func playAgain(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
