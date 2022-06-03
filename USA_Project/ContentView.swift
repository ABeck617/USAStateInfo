//
//  ContentView.swift
//  USA_Project
//
//  Created by Anthony Beckford on 5/3/22.
//

import SwiftUI

struct StateView: View {
    let stateName: String






    var body: some View {
        Text("Selected state: \(stateName)")
            .font(.largeTitle)
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @StateObject var networkManager = NetworkManager()
    

  
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(networkManager.covidInfo, id: \.self) { state in
                    NavigationLink {
                        StateView(stateName: state.state)
                    } label: {
                        Text("\(state.state)")
                    }

                    }
                }
                //.searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("USA States")
                .onAppear {
                    networkManager.fetch()
                }
               
                
            }
        }
        
//        var searchResults: [String] {
//            if searchText.isEmpty {
//                return states
//            } else {
//                return states.filter { $0.localizedCaseInsensitiveContains(searchText)}
//            }
//        }
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


    

