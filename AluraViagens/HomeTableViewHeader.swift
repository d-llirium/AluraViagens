//
//  HomeTableViewHeader.swift
//  AluraViagens
//
//  Created by user on 02/06/22.
//

import UIKit

class HomeTableViewHeader: UIView
{
    // MARK: - Outlets
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func configuraView()
    {
        headerView.backgroundColor = UIColor(
            red: 30/255
            , green: 59/255
            , blue: 119/255
            , alpha: 1
        )
    }

}
