//
//  ContentView.swift
//  ParseSwift Example
//
//  Created by David Hakki on 2/8/22.
//

import SwiftUI
import ParseSwift

//: Create a query just as you normally would.
var query = GameScore.query()

//: To use subscriptions inside of SwiftUI
struct ContentView: View {

    //: A LiveQuery subscription can be used as a view model in SwiftUI
    @ObservedObject var subscription = query.subscribe!
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        VStack {

            if subscription.subscribed != nil {
                Text("Subscribed to query!")
            } else if subscription.unsubscribed != nil {
                Text("Unsubscribed from query!")
            } else if let event = subscription.event {

                //: This is how you register to receive notifications of events related to your LiveQuery.
                switch event.event {

                case .entered(let object):
                    Text("Entered with points: \(String(describing: object.points))")
                case .left(let object):
                    Text("Left with points: \(String(describing: object.points))")
                case .created(let object):
                    Text("Created with points: \(String(describing: object.points))")
                case .updated(let object):
                    Text("Updated with points: \(String(describing: object.points))")
                case .deleted(let object):
                    Text("Deleted with points: \(String(describing: object.points))")
                }
            } else {
                Text("Not subscribed to a query")
            }

            Text("Update GameScore in Parse Dashboard to see changes here:")

            Button(action: {
                try? query.unsubscribe()
            }, label: {
                Text("Unsubscribe")
                    .font(.headline)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(20.0)
            })
            Spacer()
                .onChange(of: scenePhase, perform: { newPhase in
                    if newPhase == .background {
                        print("in background")
                    } else {
                        query.subscribe!
                     //   print(test?.results)
                    }
                    
                
                })
                
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
