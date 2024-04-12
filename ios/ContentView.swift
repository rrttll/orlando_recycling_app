//
//  ContentView.swift
//  RecycleChat
//
//  Created by Mehran Sarwar on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var chats: [String] = ["Welcome to Chat Bot 2.0"]
    
    var body: some View {
        VStack {
            HStack {
                Text("OrlandoRecycle")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            ScrollView {
                // Chats
            }
            
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        //sendMessage
                    }
                
                Button {
                    //sendMessage
                } label: {
                    Image(systemName: "paperplabe.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
                }
            .padding()
            }
        }
    }

#Preview {
    ContentView()
}
