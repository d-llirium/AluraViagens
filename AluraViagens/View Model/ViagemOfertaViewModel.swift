//
//  ViagemOfertaViewModel.swift
//  AluraViagens
//
//  Created by user on 07/06/22.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel
{
    // MARK: - ATRIBUTOS
    var tituloSecao: String
    {
        return "Ofertas"
    }
    var tipo: ViagemViewModelType
    {
        return .ofertas
    }
    var viagens: [ Viagem ]
    var numeroDeLinhas: Int
    {
        return 1
    }
    
    // MARK: - INICIALIZADOR
    init(_ viagens: [ Viagem ] )
    {
        self.viagens = viagens
    }
    
}
