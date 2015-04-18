//
//  ViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/18/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBAction func choosePaper(sender: UIButton) {
        performSegueWithIdentifier("ResultsViewControllerSegueForPaper", sender: self)
    }

    @IBAction func chooseRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewControllerSID") as! ResultsViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultsViewControllerSegueForPaper" {
            
        }
    }
}

