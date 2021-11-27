//
//  Models.swift
//  Cryptonize
//
//  Created by Suraj Rawat on 22/11/21.
//

import Foundation

struct Crypto: Codable {
    let id: String
    let name: String?
    let current_price: Float?
    let symbol: String
    let image: String
}


