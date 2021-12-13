//
//  PostListView.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment(\.isSearching) var isSearching
    @State var presentWebView = false
    @State var webView : WebView?
    
    var body: some View {
       
        ZStack{
            // checks if user is searching using environment variable
            if isSearching{
                
                if listViewModel.filteredPostArray.count > 0{
                    
                    PostListComponent(array: $listViewModel.filteredPostArray, presentWebView: $presentWebView, webView: $webView)
                    
                }else{
                    //Display list with no results if array is empty
                    List{
                        
                        Text("No results :(")
                        
                    }
                    
                }
                
                
            }else{
                // display regular, unfiltered list view
                PostListComponent(array: $listViewModel.postArray,presentWebView: $presentWebView, webView: $webView)
                
            }
            
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView().environmentObject(ListViewModel())
    }
}

// list component 
struct PostListComponent:View{
    
    @Binding var array : [Children]
    @Binding var presentWebView : Bool
    @Binding var webView : WebView?
    
    
    var body : some View{
        
        List{
            
            ForEach(array, id: \.id){
                post in
                
                VStack(alignment:.leading,spacing: 10){
                    Text("\(post.data.title)").font(.system(.title2)).bold().lineLimit(2).padding(.top,8)
                    Text("Subreddit: \(post.data.subreddit)").font(.system(.caption))
                    Text("Subscribers: \(post.data.subreddit_subscribers)").font(.system(.caption))
                    
                    
                }.foregroundColor(.primary)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        
                        
                        webView = WebView(req: URLRequest(url: URL(string: "https://www.reddit.com/\(post.data.permalink)")!), webView: nil)
                        
                        presentWebView = true
                        
                    }
                
            }
            
            
        }
        .fullScreenCover(isPresented: $presentWebView) {
            
        } content: {
            
            VStack{
                Button {
                    presentWebView = false
                } label: {
                    Text("Exit").frame(maxWidth:.infinity,alignment: .leading).padding(.leading)
                }.frame(maxWidth:.infinity)
                
                
                webView
                
            }
            
        }
        
        
    }
    
    
}
