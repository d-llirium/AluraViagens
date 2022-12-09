//
//  DetalheViewController.swift
//  AluraViagens
//
//  Created by user on 29/11/22.
//

import UIKit

class DetalheViewController: UIViewController
{
    //MARK: - ATRIBUTES
    var viagem: Viagem?
    //MARK: - IBOutlets
    @IBOutlet weak var viagemImage: UIImageView!
    
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    //MARK: - instancia
    class func instantiateViewController(
        _ viagem: Viagem
    ) -> DetalheViewController {
        let vc = DetalheViewController(
            nibName: String(
                describing: self
            ), // retorna o nome da VC
            bundle: nil
        )
        vc.viagem = viagem
        return vc
    }
    //MARK: - View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configuraView()
    }
    func configuraView() {
        viagemImage.image = UIImage(
            named: viagem?.asset ?? ""
        )
        tituloViagemLabel.text = viagem?.titulo
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
    }

    //MARK: - Actions
    @IBAction func tapBackButton(
        _ sender: UIButton
    ){
        navigationController?.popViewController(
            animated: true
        )
    }
}
