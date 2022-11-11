//
//  DecodableData.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 28/01/21.
//

import Foundation

let secaoDeViagens: [ ViagemViewModel ]? = load( "server-response.json" )

// MARK: - func carrega o conteúdo do (arquivo)
func load(
    _ filename: String
) -> [ ViagemViewModel ]? {
    
    guard let file = Bundle.main.url( // MARK: - recupera a localização
        forResource: filename
        , withExtension: nil
    )
        else {
            fatalError( "Couldn't find \(filename) in main bundle." )
    }

    let data: Data
    do {
        data = try Data( // MARK: - carrega o arquivo como DADOS (buffer)
            contentsOf: file
        )
    } catch {
        fatalError( "Couldn't load \(filename) from main bundle:\n\(error)" )
    }
    
    do {
        guard let json = try JSONSerialization// MARK: - converte / traduz os DADOS para JSON
            .jsonObject(
            with: data
            , options: []
        ) as? [String: Any] else {
            fatalError( "error to read json dictionary" )
        }
        
        guard let listaDeViagens = json[ "viagens" ] // MARK: - recurera o conteúdo do JSON com a chave "viagens" - lista de viagens
                as? [ String: Any ] else {
            fatalError( "error to read travel list" )
        }
        
        guard let jsonData = TiposDeViagens // MARK: - converte / traduz o JSON - lista de viagens - para DADOS
            .jsonToData(
            listaDeViagens
        ) else { return nil }
        
        let tiposDeViagens = TiposDeViagens // MARK: - DADOS são armazenados nos OBJETOS
            .decodeJson( jsonData )
        
        var listaViagemViewModel: [ ViagemViewModel ] = []
        
        for secao in listaDeViagens.keys
        {
            // MARK: - preenche os DICIONÁRIOS de viagens por tipos de viagens
            switch ViagemViewModelType( rawValue: secao )
            {
            case .destaques:
                if let destaques = tiposDeViagens?.destaques
                {
                    let destaqueViewModel = ViagemDestaqueViewModel( destaques )
                    listaViagemViewModel.insert(
                        destaqueViewModel
                        , at: 0
                    )
                }
            case .ofertas:
                if let ofertas = tiposDeViagens?.ofertas
                {
                    let ofertaViewModel = ViagemOfertaViewModel( ofertas )
                    listaViagemViewModel.append( ofertaViewModel )
                }
            default:
                break
            }
        }
        
        return listaViagemViewModel
    } catch {
        fatalError( "Couldn't parse" )
    }
}
