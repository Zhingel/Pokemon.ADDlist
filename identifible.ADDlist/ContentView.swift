//
//  ContentView.swift
//  identifible.ADDlist
//
//  Created by Стас Жингель on 13.01.2021.
//

import SwiftUI
struct Pokemon: Identifiable {
    let id = UUID() //если ставим тип int то нужно будет вести счет id в массиве
  let name: String
  let type: String
  let color: Color
}

struct ContentView : View {
  @State  var pokemonList = [ //добавляя стейт я могу использовать переменную в функциях
        Pokemon( name: "Charmander", type: "Fire", color: .red),
        Pokemon(name: "Squirtle", type: "Water", color: .blue),
        Pokemon(name: "Bulbasaur", type: "Grass", color: .green),
        Pokemon(name: "Pikachu", type: "Electric", color: .yellow)
      ]
  var body: some View {
    NavigationView{
    List(pokemonList) { pokemon in //могу удалить id:\.name
        
      HStack {
        Text(pokemon.name)
        Text(pokemon.type).foregroundColor(pokemon.color)
      }
    }.navigationBarTitle("Pokemon")
    .navigationBarItems(trailing: Button(action: addPokemon, label: {
        Text("add")
    }))
      
    }
  }
     func addPokemon() {
        if let randomPokemon = pokemonList.randomElement() {
            pokemonList.append(randomPokemon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
