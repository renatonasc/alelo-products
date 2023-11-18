//
//  ProductListViewCell.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct ProductListViewCell: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image ?? "")) { image in
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
                Text(product.name ?? "-")
                    .font(.title3)
                    .fontWeight(.medium)
                HStack {
                    Text("\(product.actualPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    if (product.onSale == true) {
                        Text("\(product.regularPrice ?? "R$ -")")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .fontWeight(.regular)
                        .strikethrough()
                        
                        Text("\(product.discountPercentage ?? "-") OFF")
                        .foregroundColor(.red)
                        .font(.caption)
                        .fontWeight(.regular)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct ProductListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListViewCell(product: MockData.productThree)
    }
}
