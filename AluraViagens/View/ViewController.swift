//
//  ViewController.swift
//  AluraViagens
//
//  Created by user on 31/05/22.
//

import UIKit


class ViewController: UIViewController
{
    // MARK: - Outlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configurtaTableView()
        view.backgroundColor = UIColor(
            red: 30/255
            , green: 59/255
            , blue: 119/255
            , alpha: 1
        )
    }
    func configurtaTableView()
    {
        viagensTableView.register(
            UINib(
                nibName: "ViagemTableViewCell"
                , bundle: nil
            )
            , forCellReuseIdentifier: "ViagemTableViewCell"
        )
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        
    }

}

extension ViewController: UITableViewDataSource
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
        guard let celulaViagem = tableView.dequeueReusableCell(
            withIdentifier: "ViagemTableViewCell"
        ) as? ViagemTableViewCell else {
            fatalError( "error creating ViagemTableViewCell" )
        }
        
        return celulaViagem
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(
        _ tableView: UITableView
        , viewForHeaderInSection section: Int
    ) -> UIView? {
        let headerView = Bundle.main.loadNibNamed(
            "HomeTableViewHeader"
            , owner: self
            , options: nil
        )?.first as? HomeTableViewHeader
        headerView?.configuraView()
        
        return headerView
    }
    func tableView(
        _ tableView: UITableView
        , heightForHeaderInSection section: Int
    ) -> CGFloat {
        
        return 300
    }
    func tableView(
        _ tableView: UITableView
        , heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 400
    }
}


