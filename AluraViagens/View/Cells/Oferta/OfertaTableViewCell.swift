//
//  OfertaTableViewCell.swift
//  AluraViagens
//
//  Created by user on 07/06/22.
//

import UIKit

protocol OfertaTableViewCellDelegate: AnyObject // porque essa cell possui duas viagens diferentes
{
    func didSelectView(
        _ viagem: Viagem?
    )
}

class OfertaTableViewCell: UITableViewCell
{
    // MARK: - ATRIBUTES
    private var viagens: [ Viagem ]?
    
    weak var delegate: OfertaTableViewCellDelegate?
    
    // MARK: - Outlets
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagemLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]! // views tagueadas
    
    func configuraCelula(
        _ viagens: [Viagem]?
    ) {
        self.viagens = viagens
        guard let listaDeViagens = viagens
        else { return }
        
        for index in 0..<listaDeViagens.count
        {
            setOutlets(
                index,
                viagem: listaDeViagens[ index ]
            )
        }
        fundoViews.forEach
        { viewAtual in
            viewAtual.addGestureRecognizer(
                UIGestureRecognizer(
                    target: self,
                    action: #selector(
                        didSelectView(_ : )
                    )
                )
            )
            viewAtual.addSombra()
        }
    }
    
    func setOutlets(
        _ index: Int,
        viagem: Viagem
    ) {
        let imageOutlet = viagemImages[ index ]
        imageOutlet.image = UIImage( named: viagem.asset )
        
        let tituloOutlet = tituloViagemLabels[ index ]
        tituloOutlet.text = viagem.titulo
        
        let subtituloOutlet = subtituloViagemLabels[ index ]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoSemDescontoOutlet = precoSemDescontoLabels[ index ]
        precoSemDescontoOutlet.text = "A partir de R$ \( viagem.precoSemDesconto )"
        
        let precoOutlet = precoLabels[ index ]
        precoOutlet.text = "R$ \( viagem.preco )"
    }
    
    // MARK: - Actions
    @objc func didSelectView(
        _ gesture: UIGestureRecognizer
    ) {
        if let selectedView = gesture.view // retorna a view que recebeu o gesto
        {
            let viagemSelecionada = viagens?[
                selectedView.tag // identifica a view pelo tag
            ]
            delegate?.didSelectView( // chamada pela ViewController quando seleciona a célula de oferta
                viagemSelecionada
            )
        }
    }
}
