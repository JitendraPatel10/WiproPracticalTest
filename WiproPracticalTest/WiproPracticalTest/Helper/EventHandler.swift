//
//  EventHandler.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation

///This enum of API call events.
enum EventHandler {
    case startLoading
    case endLoading
    case dataLoaded
    case dataAdded
    case error(CustomError)
}
