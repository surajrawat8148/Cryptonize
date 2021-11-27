//
//  APICaller.swift
//  Cryptonize
//
//  Created by Suraj Rawat on 21/11/21.
//

import Foundation
import UIKit

final class APICaller{
    static let shared = APICaller()
    
    private struct Constants{
        static let apiKey = "A0390F71-DF9E-4477-860A-A0FF5FD4C273"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
        static let Suraj =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    }
    
    private init() {}
    

//    Mark:- Public
    
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ){
        
        
        guard let url = URL(string: Constants.Suraj) else{
            return
        
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
//                Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos.sorted { first, second -> Bool in
                    return first.current_price ?? 0 > second.current_price ?? 0
                    }))
            }
            
            catch {
                completion(.failure(error))
                
            }
        }
        
        task.resume()
                                              
    }
    

}

