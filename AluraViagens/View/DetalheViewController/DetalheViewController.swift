//
//  DetalheViewController.swift
//  AluraViagens
//
//  Created by user on 29/11/22.
//

import UIKit

class DetalheViewController: UIViewController
{
    //MARK: - IBOutlets
    @IBOutlet weak var viagemImage: UIImageView!
    
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    //MARK: - View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

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
