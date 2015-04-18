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
        performSegueWithIdentifier("ResultsViewControllerSegue", sender: self)
    }

    @IBAction func chooseRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewControllerSID") as! ResultsViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

