//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/22/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var allTimeWinnerImageView: UIImageView!
    @IBOutlet weak var humanWinsTallyLabel: UILabel!
    @IBOutlet weak var computerWinsTallyLabel: UILabel!
    
    var history: [MatchResult]!
    var totalHumanWins = 0
    var totalComputerWins = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for matchResult: MatchResult in history {
            switch matchResult.whoWon! {
            case .Computer:
                totalComputerWins++
            case .Human:
                totalHumanWins++
            default:
                break
            }
        }
        humanWinsTallyLabel.text = String(totalHumanWins)
        computerWinsTallyLabel.text = String(totalComputerWins)
        if totalHumanWins > totalComputerWins {
            allTimeWinnerImageView.image = UIImage(named: "HumanWins")
        } else if totalComputerWins > totalHumanWins {
            allTimeWinnerImageView.image = UIImage(named: "ComputerWins")
        } else {
            allTimeWinnerImageView.image = UIImage(named: "NoWinner")
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")!
        let matchResult = history[indexPath.row]
        cell.textLabel?.text = matchResult.whoWonResult
        cell.detailTextLabel?.text = "You chose:\(matchResult.humanPlayersChoice). Computer chose:\(matchResult.computerPlayersChoice)."
        cell.imageView?.image = UIImage(named: matchResult.imageName)
        return cell
    }

    @IBAction func goBack(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
