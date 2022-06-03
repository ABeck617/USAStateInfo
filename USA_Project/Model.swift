//
//  Model.swift
//  USA_Project
//
//  Created by Anthony Beckford on 5/24/22.
//

import Foundation


struct CovidInfo: Decodable, Hashable {
    var created_at: String
    var state: String
    var tot_cases: String
    var new_case: String
    var tot_death: String
    var new_death: String
}
