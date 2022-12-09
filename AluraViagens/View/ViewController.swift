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
    func goToDetalheViewController(
        _ viagem: Viagem?
    ) {
        if let viagemSelecionada = viagem
        {
            let detalheVC = DetalheViewController.instantiateViewController(
                viagemSelecionada
            )
            navigationController?.pushViewController(
                detalheVC, animated: true
            )
        }
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
    ) -> UITableViewCell
    {
        let viewModel = secaoDeViagens?[ indexPath.section ]
        print("===== SECTION \(indexPath.section)")
        
        switch viewModel?.tipo // tipo da secao
        {
            case .destaques:
                guard let celulaDestaque = tableView.dequeueReusableCell( // viagens detacadas
                    withIdentifier: "ViagemTableViewCell"
                ) as? ViagemTableViewCell
                else {
                    fatalError( "error creating ViagemTableViewCell" )
                }
                
                celulaDestaque.configuraCelula(
                    viewModel?.viagens[
                        indexPath.row
                    ]
                )
                
                return celulaDestaque
                
            case .ofertas:
                guard let celulaOferta = tableView.dequeueReusableCell( // viagens com ofertas
                    withIdentifier: "OfertaTableViewCell"
                ) as? OfertaTableViewCell
                else {
                    fatalError( "error creating OfertaTableViewCell" )
                }
            
                celulaOferta.delegate = self // para poder implementar o protocolo
            
                celulaOferta.configuraCelula(
                    viewModel?.viagens
                )
            
                return celulaOferta
            default:
                return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate
{
//    func tableView(
//        _ tableView: UITableView,
//        didDeselectRowAt indexPath: IndexPath
//    ) {
//        let detalheController = UIStoryboard( // acessa o ViewController do StoryBoard
//            name: "Main",
//            bundle: nil
//        ).instantiateViewController(
//            withIdentifier: "DetalheViewController"
//        )
//        navigationController?.pushViewController(
//            detalheController,
//            animated: true
//        )
//    }
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sectionViewModel = secaoDeViagens?[ // retorna a seção
            indexPath.section
        ]
        print(secaoDeViagens?[indexPath.section] ?? "y")
        
        switch sectionViewModel?.tipo
        {
            case .destaques,
                    .internacionais:
                let viagemSelecionada = sectionViewModel?
                    .viagens[ // retorna a viagem
                        indexPath.row
                    ]
                goToDetalheViewController(
                    viagemSelecionada
                )
            case .ofertas:
                let viagemSelecionada = sectionViewModel?
                    .viagens[ // retorna a viagem
                        indexPath.row
                    ]
                goToDetalheViewController(
                    viagemSelecionada
                )
            case .none:
                break
        }
        print(sectionViewModel?.viagens[indexPath.row] ?? "x")

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

// MARK: - OfertaTableViewCellDelegate
extension ViewController: OfertaTableViewCellDelegate
{
    func didSelectView(
        _ viagem: Viagem?
    ) {
        goToDetalheViewController( // vai para o detalhe da célula selecionada
            viagem
        )
    }
}


