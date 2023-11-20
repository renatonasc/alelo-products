//
//  EmptyView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 20/11/23.
//

import SwiftUI

struct EmptyView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                    .frame(height: 100)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyView(imageName: "cart", message: "Empty cart :(")
}
