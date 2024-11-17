//
//  ContentView.swift
//  JokesApi
//
//  Created by Hatice Taşdemir on 17.11.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = Jokes()
    var body: some View {
        NavigationView{
            List(viewModel.jokes) {element in
                Text(element.value)
                
            }
            .toolbar{
                Button (action: addJokes){
                    Text("get new joke")
                }

            }
            .navigationTitle("Chuck Norris")
        }
       
        }
    func addJokes() {
        viewModel.fetchJokes()
    }
}

#Preview {
    ContentView()
}
