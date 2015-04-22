//
//  ViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/18/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    var history = [MatchResult]()
    
    private func randomRoshamboObject() -> String {
        let roshamboObjects = ["rock", "paper", "scissor"]
        let roshamboObjectIndex = Int(arc4random() % 3)
        return roshamboObjects[roshamboObjectIndex]
    }
    
    @IBAction func choosePaper(sender: UIButton) {
        performSegueWithIdentifier("ResultsViewControllerSegueForPaper", sender: self)
    }

    @IBAction func chooseRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewControllerSID") as! ResultsViewController
        controller.matchResult = MatchResult(humanPlayersChoice: "rock", computerPlayersChoice: randomRoshamboObject())
        history.append(controller.matchResult)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultsViewControllerSegueForScissor" {
            let controller = segue.destinationViewController as! ResultsViewController
            controller.matchResult = MatchResult(humanPlayersChoice: "scissor", computerPlayersChoice: randomRoshamboObject())
            history.append(controller.matchResult)
        } else if segue.identifier == "ResultsViewControllerSegueForPaper" {
            let controller = segue.destinationViewController as! ResultsViewController
            controller.matchResult = MatchResult(humanPlayersChoice: "paper", computerPlayersChoice: randomRoshamboObject())
            history.append(controller.matchResult)
        } else if segue.identifier == "HistorySegue" {
            let controller = segue.destinationViewController as! HistoryViewController
            controller.history = history
        }
    }
}

