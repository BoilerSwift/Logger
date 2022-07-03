//
//  ContentView.swift
//  LoggerExamples
//
//  Created by Hamlit Jason on 2022/07/03.
//

import SwiftUI
import Logger

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                Logger.debug("debug") {
                    // something ...
                }
            } label: {
                Text("Logger.debug")
            }
            
            Button {
                Logger.error("error") {
                    // something ...
                }
            } label: {
                Text("Logger.error")
            }
            
            Button {
                Logger.event("event") {
                    // something ...
                }
            } label: {
                Text("Logger.event")
            }
            
            Button {
                Logger.header = "Custom Header"
            } label: {
                Text("header 변경")
            }
            
            Button {
                Logger.debug("debug", action: nil)
            } label: {
                Text("헤더 변경 후 ")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
