//
//  LiveQueryDelegate.swift
//  ParseSwift Example
//
//  Created by David Hakki on 2/8/22.
//

import Foundation
import ParseSwift

class LiveQueryDelegate: ParseLiveQueryDelegate {

    func received(_ error: Error) {
        print(error)
    }

    func closedSocket(_ code: URLSessionWebSocketTask.CloseCode?, reason: Data?) {
        print("Socket closed with \(String(describing: code)) and \(String(describing: reason))")
    }
}


