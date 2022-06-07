//
//  ViagemViewModel.swift
//  AluraViagens
//
//  Created by user on 03/06/22.
//

import Foundation

protocol ViagemViewModel
{
    var tituloSecao: String { get }
    var tipo: ViagemViewModelType { get }
    var viagens: [ Viagem ] { get set }
    var numeroDeLinhas: Int { get }
}

enum ViagemViewModelType: String
{
    case destaques, ofertas, internacionais
}
