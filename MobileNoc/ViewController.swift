//
//  ViewController.swift
//  MobileNoc
//
//  Created by AhmadNero on 3/1/19.
//  Copyright © 2019 AhmadNero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var servers:[Server] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.mocky.io/v2/5c5c46f13900005a18e05b90")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let result = try! JSONDecoder().decode(Content.self, from: data!)
            self.servers = result.content
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "server", for: indexPath) as! ServerCell
        let server = servers[indexPath.row]
        cell.name.text = server.name
        cell.ipAddress.text = server.ipAddress
        cell.ipSubnetMask.text = server.ipSubnetMask
        switch server.status.id {
        case 1:
            cell.status.backgroundColor = UIColor.green
        case 2:
            cell.status.backgroundColor = UIColor.orange
        case 3:
            cell.status.backgroundColor = UIColor.yellow
        case 4:
            cell.status.backgroundColor = UIColor.red
        default:
            break
        }
        return cell
    }
}
