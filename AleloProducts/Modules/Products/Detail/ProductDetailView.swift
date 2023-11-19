//
//  ProductDetailView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    
    let product: Product
    @Binding var isShowingDetail: Bool
    @State private var selectedSize = ""
    
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: product.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 225)
                    .cornerRadius(8)
            } placeholder: {
                Image(systemName: "photo.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                    .cornerRadius(8)
            }
            
            VStack {
                Text(product.name ?? "-")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Text("\(product.actualPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    if (product.onSale == true) {
                        Text("\(product.regularPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .fontWeight(.regular)
                        .strikethrough()
                        
                        Text("\(product.discountPercentage ?? "-") OFF")
                        .foregroundColor(.red)
                        .font(.body)
                        .fontWeight(.regular)
                        .padding()
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(product.sizes?.filter({$0.available == true}) ?? [], id: \.size ){ size in
                        Button {
                            selectedSize = size.size ?? "-"
                        } label: {
                            SizeInfo(title: size.size ?? "-", selected: (selectedSize == size.size))
                        }
                    }
                   
                }.padding(.top)
            }
            
            Spacer()
            
            Button {
                cart.add(CartItem(product: product, size: selectedSize, qtd: 1))
                isShowingDetail = false
            } label: {
                Text("Add to Cart")
            }
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }
}


#Preview {
    ProductDetailView(product: MockData.productThree, isShowingDetail: .constant(true))
}

struct SizeInfo: View {
    
    let title: String
    let selected: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
                .frame(width: 35.0, height: 25.0)
                .background(selected ? Color.accentColor : Color(UIColor.systemBackground))
                .foregroundColor(selected ? Color(UIColor.systemBackground) : Color.accentColor)
                .border(Color.accentColor, width: 2)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.accentColor, lineWidth: 5))
        }
    }
}
