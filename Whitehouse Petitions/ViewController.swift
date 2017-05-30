//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Martin Nordström on 2017-04-24.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // Array of dictionaries
    var petitions = [[String: String]]()
    
    @IBOutlet var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Whitehouse"
        
            // Points to server
            let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=20"
        
            if let url = URL(string: urlString) {
            // Returns the data from the object
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                    parse(json: json)
                }
            }
        }
    }
    
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        
        tableView.reloadData()
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //self.tableView.separatorStyle = .none
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let petition = petitions[indexPath.row]
        cell.titleLabel?.text = petition["title"]
        cell.labelBackgroundView.isUserInteractionEnabled = true
       // cell.detailTextLabel?.text = petition["body"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

