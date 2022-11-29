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
        view.backgroundColor = UIColor.backgroundWhite
        
    }
    
    func configurtaTableView()
    {
        viagensTableView.register(
            UINib(
                nibName: "ViagemTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "ViagemTableViewCell"
        )
        viagensTableView.register(
            UINib(
                nibName: "OfertaTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "OfertaTableViewCell"
        )
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource
{
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return secaoDeViagens?.count ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return secaoDeViagens?[ section ].numeroDeLinhas ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let viewModel = secaoDeViagens?[ indexPath.section ]
        print("===== SECTION \(indexPath.section)")
        
        switch viewModel?.tipo
        {
        case .destaques:
            guard let celulaDestaque = tableView.dequeueReusableCell(
                withIdentifier: "ViagemTableViewCell"
            ) as? ViagemTableViewCell
            else {
                fatalError( "error creating ViagemTableViewCell" )
            }
            celulaDestaque.configuraCelula( viewModel?.viagens[ indexPath.row ] )
            return celulaDestaque
        case .ofertas:
            guard let celulaOferta = tableView.dequeueReusableCell(
                withIdentifier: "OfertaTableViewCell"
            ) as? OfertaTableViewCell
            else {
                fatalError( "error creating OfertaTableViewCell" )
            }
            celulaOferta.configuraCelula( viewModel?.viagens )
            return celulaOferta
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate
{
    func tableView(
        _ tableView: UITableView,
        didDeselectRowAt indexPath: IndexPath
    ) {
        let detalheController = UIStoryboard( // acessa o ViewController do StoryBoard
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "DetalheViewController"
        )
        navigationController?.pushViewController(
            detalheController,
            animated: true
        )
    }
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let detalheVC = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "DetalheViewController"
        )
        navigationController?.pushViewController(
            detalheVC,
            animated: true
        )
    }
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        if section == 0
        {
            let headerView = Bundle.main.loadNibNamed(
                "HomeTableViewHeader",
                owner: self,
                options: nil
            )?.first as? HomeTableViewHeader
            headerView?.configuraView()
            
            return headerView
        }
        return nil
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        if section == 0
        {
            return 300
        }
        return 0
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}


