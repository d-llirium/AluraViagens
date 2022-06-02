//
//  ViewController.swift
//  AluraViagens
//
//  Created by user on 31/05/22.
//

import UIKit


class ViewController: UIViewController
                    , UITableViewDataSource
{
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

}

// MARK: - UITableViewDataSource
extension ViewController
{
    func tableView(
        _ tableView: UITableView
        , numberOfRowsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func tableView(
        _ tableView: UITableView
        , cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .default
            , reuseIdentifier: nil
        )
        cell.textLabel?.text = "viagen \(indexPath.row)"
        
        return cell
    }
}


