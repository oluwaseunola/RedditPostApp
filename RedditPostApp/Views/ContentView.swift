//
//  ContentView.swift
//  RedditPostApp
//
//  Created by Seun Olalekan on 2021-12-11.
//

import SwiftUI


struct ContentView: View {
   
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var postAmount = ""
    @State var text = ""
    @FocusState var focus : Bool

    var body: some View {
       
            NavigationView{
                
                VStack{
                
                VStack{Text("Amount of posts to display")

                    TextField("", text: $postAmount, prompt: Text("1")).frame(maxWidth:100).frame(height: 50).multilineTextAlignment(.center).overlay(RoundedRectangle(cornerRadius: 6, style: .continuous).stroke().foregroundColor(.black)).padding(.horizontal)
                        .onSubmit {
                            focus = false
                        }.focused($focus)


                }
            
            NavigationLink{

                PostListView().navigationTitle("Reddit Posts").searchable(text: $text, placement: .toolbar, prompt: "Search a subreddit!", suggestions: {
                    
                    ForEach(listViewModel.postArray.prefix(5)) { post in
                        
                        Text(post.data.subreddit)
                        
                    }
                    
                    
                    
                }).onSubmit(of: .search) {
                    
                    listViewModel.filterPosts(text: text)

                    
                }


            } label: {
                
                Text("let's go!").font(.system(.caption)).foregroundColor(.white).frame(maxWidth:.infinity).frame(height:60).background(Color.indigo).mask(RoundedRectangle(cornerRadius: 10, style: .continuous))



            }.padding()
                    .simultaneousGesture(TapGesture().onEnded{
                        Task{
                            await fetchPosts()
                        }
                        
                    })
                    
                

                
        }.navigationTitle(Text("Explore Reddit Today"))
                    
                    
                
            }
                
                
            
            
            
        
            
    }
    
    private func fetchPosts() async{
        
        await listViewModel.fetchPosts(postAmount: Int(postAmount) ?? 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ListViewModel())
    }
}
