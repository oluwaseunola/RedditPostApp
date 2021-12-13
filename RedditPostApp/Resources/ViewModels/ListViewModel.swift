//
//  ListViewModel.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var postArray = [Children]()
    @Published var filteredPostArray = [Children]()
    
    // Fetch posts for reddit endpoint
    @MainActor
     func fetchPosts(postAmount: Int) async {
        
        let urlString = "https://www.reddit.com/.json?&limit=\(postAmount)"
        
         let results = await NetworkManager.shared.fetchData(urlString: urlString)
               
         postArray = results[0].data.children
         
         
        
    }
    // Filter initial posts according to input by user
    func filterPosts(text: String){
        var filteredPosts = [Children]()
       
        for post in postArray{
        
            
            if post.data.subreddit.lowercased().range(of: text.lowercased(), options: .regularExpression) != nil{
                
                
                filteredPosts.append(post)
        
            }
            
        }
        
        self.filteredPostArray = filteredPosts
        
    }
    
}
