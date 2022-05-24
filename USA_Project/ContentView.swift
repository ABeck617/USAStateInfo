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
    

    var states = [ "Alabama",
                   "Alaska",
                   "Arizona",
                   "Arkansas",
                   "California",
                   "Colorado",
                   "Connecticut",
                   "Delaware",
                   "Florida",
                   "Georgia",
                   "Hawaii",
                   "Idaho",
                   "Illinois",
                   "Indiana",
                   "Iowa",
                   "Kansas",
                   "Kentucky",
                   "Louisiana",
                   "Maine",
                   "Maryland",
                   "Massachusetts",
                   "Michigan",
                   "Minnesota",
                   "Mississippi",
                   "Missouri",
                   "Montana",
                   "Nebraska",
                   "Nevada",
                   "New Hampshire",
                   "New Jersey",
                   "New Mexico",
                   "New York",
                   "North Carolina",
                   "North Dakota",
                   "Ohio",
                   "Oklahoma",
                   "Oregon",
                   "Pennsylvania",
                   "Rhode Island",
                   "South Carolina",
                   "South Dakota",
                   "Tennessee",
                   "Texas",
                   "Utah",
                   "Vermont",
                   "Virginia",
                   "Washington",
                   "West Virginia",
                   "Wisconsin",
                   "Wyoming" ]
  
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.searchResults, id: \.self) { item in
                    NavigationLink {
                        StateView(stateName: item)
                    } label: {
                        Text("\(item)")
                    }

                    }
                }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("USA States")
               
                
            }
        }
        
        var searchResults: [String] {
            if searchText.isEmpty {
                return states
            } else {
                return states.filter { $0.localizedCaseInsensitiveContains(searchText)}
            }
        }
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


    

