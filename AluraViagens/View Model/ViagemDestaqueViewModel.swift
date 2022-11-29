//
//  ViagemDestaqueViewModel.swift
//  AluraViagens
//
//  Created by user on 03/06/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel
{
    var tituloSecao: String
    {
        return "Destaques"
    }
    var tipo: ViagemViewModelType
    {
        return .destaques
    }
    var viagens: [ Viagem ]
    var numeroDeLinhas: Int
    {
        return viagens.count
    }
    init(
        _ viagens: [ Viagem ]
    ) {
        self.viagens = viagens
    }
}
