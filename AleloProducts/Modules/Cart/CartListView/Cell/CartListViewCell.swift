//
//  CartListViewCell.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 19/11/23.
//

import SwiftUI

struct CartListViewCell: View {
    
    
    @Binding var item: CartItem
    @Binding var qtd: Int
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.product.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image(systemName: "photo.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.product.name ?? "-")
                    .font(.title3)
                    .fontWeight(.medium)
                HStack {
                    Text("\(item.product.actualPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    if (item.product.onSale == true) {
                        Text("\(item.product.regularPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .fontWeight(.regular)
                        .strikethrough()
                        
                        Text("\(item.product.discountPercentage ?? "-") OFF")
                        .foregroundColor(.red)
                        .font(.caption)
                        .fontWeight(.regular)
                    }
                }
                VStack(alignment: .leading){
                    Text("Size: \(item.size.size ?? "-")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                    HStack {
                        Text("Qtd:")
                            .foregroundColor(.secondary)
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .opacity(0.6)
                            
                            Image(systemName: "minus")
                                .imageScale(.small)
                                .frame(width: 44, height: 44)
                                .foregroundColor(.black)
                        }.onTapGesture {
                            qtd -= 1
                        }
                        
                        Text("\(Int(item.qtd))")
                            .foregroundColor(.secondary)
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .opacity(0.6)
                            
                            Image(systemName: "plus")
                                .imageScale(.small)
                                .frame(width: 44, height: 44)
                                .foregroundColor(.black)
                        }.onTapGesture {
                            qtd += 1
                        }
    
                    }
                }
                .padding(.top)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    CartListViewCell(item: .constant(MockData.cartItemOne), qtd: .constant(0))
}
