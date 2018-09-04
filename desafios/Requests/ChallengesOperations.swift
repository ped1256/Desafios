//
//  ChallengesOperations.swift
//  desafios
//
//  Created by Pedro Emanuel on 20/08/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation

class ChallengeOperationRequest : NSObject {
 
    var challenges: [Challenge]?
    
    func getAllChallengesFromAPI(completion: @escaping ([Challenge]) -> ()){
    
        let url = URL(string: "https://tilappvaportest.vapor.cloud/api/acronyms")
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion([Challenge]())
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                dump(json)
                
            }catch{
                
            }
            
        }
        session.resume()
    }
}
