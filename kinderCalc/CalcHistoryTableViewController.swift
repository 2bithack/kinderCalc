//
//  CalcHistory.swift
//  kinderCalc
//
//  Created by enzo bot on 11/28/16.
//  Copyright © 2016 GarbageGames. All rights reserved.
//

import Foundation
import UIKit

class CalcHistoryTableViewController: UITableViewController {
    
    var calculations: [String] = []
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) 
        
        let calculation = calculations[indexPath.row]
        
        cell.textLabel?.text = calculation

        return cell
    }
    
}
