//
//  ParseSwift_ExampleApp.swift
//  ParseSwift Example
//
//  Created by David Hakki on 2/8/22.
//

import SwiftUI
import ParseSwift

@main
struct ParseSwift_ExampleApp: App {
    
    init() {
        let configuration = ParseConfiguration(applicationId: "ssTRF4NAkP3BbymlClMLCZkxaqmTWaY0BpPRBU5x", clientKey: "7I2ysa16eDCJI3VkugPHkne93xMLAIo9DfBLMDCY", serverURL: URL(string: "https://parseapi.back4app.com")!, liveQueryServerURL: URL(string: "parseswiftexample.b4a.io"))
        ParseSwift.initialize(configuration: configuration)
        
       /* let delegate = LiveQueryDelegate()
        if let socket = ParseLiveQuery.getDefault() {
            socket.receiveDelegate = delegate
        }*/
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
