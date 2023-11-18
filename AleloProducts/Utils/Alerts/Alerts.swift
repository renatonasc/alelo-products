//
//  Alerts.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct AlertInfo: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertInfoObject {
    
    //MARK: - Network Alerts
    static let invalidData      = AlertInfo(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertInfo(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertInfo(title: Text("Sever Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertInfo(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    
    
    static let genericError = AlertInfo(title: Text("Error"),
                                            message: Text("Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
}
