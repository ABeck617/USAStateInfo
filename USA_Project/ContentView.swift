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
    @State private var showData: Bool = false
    @StateObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Maryland")
                        .font(.system(size: 17, weight: .bold))
                    
                    Button {
                        showData.toggle()
                    } label: {
                        Text(showData ? "Hide Data" : "Show Data")
                    }
                    if showData {
                        ForEach(networkManager.covidInfo.sorted(by: { $1.created_at < $0.created_at }), id: \.self) { item in
                            ForEach(states.sorted(by: ==), id: \.key) { key, value in
                                if filterState(state: item.state, key: key, stateAbrv: "MD") {
                                    NavigationLink {
                                        StateView(stateName: item.state)
                                    } label: {
                                        Text("\(item.created_at)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("USA States")
        .onAppear {
            networkManager.fetch()
        }
    }
    
    func filterState(state: String, key: String?, stateAbrv: String) -> Bool {
        if state == stateAbrv && state == key {
            return true
        } else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let states = [
    "AK" : "Alaska",
    "AL" : "Alabama",
    "AR" : "Arkansas",
    "AS" : "American Samoa",
    "AZ" : "Arizona",
    "CA" : "California",
    "CO" : "Colorado",
    "CT" : "Connecticut",
    "DC" : "District of Columbia",
    "DE" : "Delaware",
    "FL" : "Florida",
    "GA" : "Georgia",
    "GU" : "Guam",
    "HI" : "Hawaii",
    "IA" : "Iowa",
    "ID" : "Idaho",
    "IL" : "Illinois",
    "IN" : "Indiana",
    "KS" : "Kansas",
    "KY" : "Kentucky",
    "LA" : "Louisiana",
    "MA" : "Massachusetts",
    "MD" : "Maryland",
    "ME" : "Maine",
    "MI" : "Michigan",
    "MN" : "Minnesota",
    "MO" : "Missouri",
    "MS" : "Mississippi",
    "MT" : "Montana",
    "NC" : "North Carolina",
    "ND" : "North Dakota",
    "NE" :"Nebraska",
    "NH" :"New Hampshire",
    "NJ" :"New Jersey",
    "NM" :"New Mexico",
    "NV" : "Nevada",
    "NY" : "New York",
    "OH" :"Ohio",
    "OK" :"Oklahoma",
    "OR" : "Oregon",
    "PA" : "Pennsylvania",
    "PR" :"Puerto Rico",
    "RI" : "Rhode Island",
    "SC" : "South Carolina",
    "SD" : "South Dakota",
    "TN" : "Tennessee",
    "TX" : "Texas",
    "UT" : "Utah",
    "VA" : "Virginia",
    "VI" : "Virgin Islands",
    "VT" : "Vermont",
    "WA" : "Washington",
    "WI" : "Wisconsin",
    "WV" : "West Virginia",
    "WY" : "Wyoming"
]
