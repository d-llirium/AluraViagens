//
//  ViagemTableViewCell.swift
//  AluraViagens
//
//  Created by user on 03/06/22.
//

import UIKit

class ViagemTableViewCell: UITableViewCell
{
    //MARK: - Outlets
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloVIagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
    
    func configuraCelula(
        _ viagem: Viagem?
    ) {
        viagemImage.image = UIImage(
            named: viagem?.asset ?? ""
        )
        tituloVIagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(
            string: "R$ \( viagem?.precoSemDesconto ?? 0 )"
        )
        atributoString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSMakeRange(
                0,
                atributoString.length
            )
        )
        precoSemDescontoLabel.attributedText = atributoString
        precoViagemLabel.text = "R$ \( viagem?.preco ?? 0 )"
        
        if let numeroDeDias = viagem?.diaria,
           let numeroDeHospedes = viagem?.hospedes
        {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoas" : "Pessoas"
            
            diariaViagemLabel.text = " \( numeroDeDias ) \( diarias ) - \( numeroDeHospedes ) \( hospedes )"
        }
        DispatchQueue.main.async
        {
            self.backgroundViewCell.addSombra()
        }
    }
}
