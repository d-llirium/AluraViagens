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
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func configuraView()
    {
        headerView.backgroundColor = UIColor(
            red: 30/255
            , green: 59/255
            , blue: 119/255
            , alpha: 1
        )
        headerView.layer.cornerRadius = 500
        headerView.layer.maskedCorners =
        [
            .layerMaxXMaxYCorner
            , .layerMinXMaxYCorner
    ]
        
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
    }

}
