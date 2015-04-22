//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Sanjib Ahmad on 4/22/15.
//  Copyright (c) 2015 Object Coder. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    var history: [MatchResult]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as! UITableViewCell
        cell.textLabel?.text = history[indexPath.row].humanPlayersChoice
        return cell
    }

}
