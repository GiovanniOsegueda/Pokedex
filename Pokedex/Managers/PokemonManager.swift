//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Giovanni Osegueda on 11/14/22.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon]{
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    func getDetailPokemon(id: Int, completion:@escaping (DetailPokemon) -> ()){
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/1/\(id)", model: DetailPokemon.self) {data in
            completion(data)
        } failure: {error in
            print(error)
        }
    }
}
