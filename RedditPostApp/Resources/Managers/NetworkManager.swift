//
//  NetworkManager.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import Foundation

struct NetworkManager{
    
    static var shared = NetworkManager()
    
    // fetch reddit page data
    
    func fetchData(urlString: String) async -> [PostModel]{
        
        guard let url = URL(string: urlString) else{
            print("error unwrapping URL string")
            return []
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let results = try JSONDecoder().decode(PostModel.self, from: data)
            
            return [results]
            
        }
        catch{
            
            print("error fetching post data: \(error)")
            return []
        }
        
    }
    
    
    
}
