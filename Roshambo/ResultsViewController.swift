//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/18/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {



    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
