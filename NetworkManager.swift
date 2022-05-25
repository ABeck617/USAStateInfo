//
//  NetworkManager.swift
//  USA_Project
//
//  Created by Anthony Beckford on 5/24/22.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    @Published var covidInfo: [CovidInfo] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    
    func fetch() {
        let url = URL(string: "https://data.cdc.gov/resource/9mfq-cb36.json")! // Connect to the Internet
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [CovidInfo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { [unowned self] completion in
                if case .failure(let error) = completion {
                    print("Error! \(error.localizedDescription)")
                }
            } receiveValue: { [unowned self] covidInfoReceived in
                covidInfo = covidInfoReceived
                print(covidInfo)
            }
            .store(in: &cancellables)
    }
}
