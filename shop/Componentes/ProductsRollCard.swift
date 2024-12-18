//
//  ProductsRollCard.swift
//  shop
//
//  Created by Alan Ramalho on 09/11/24.
//

import SwiftUI

struct ProductsRollCard: View {
    @Binding var ListaDeProdutos: [Produto]
    @Binding var CategoriaSelecionada: String
    var body: some View {
        // -------------- produtos

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {

                if CategoriaSelecionada != "Todos" {
                    if ListaDeProdutos.isEmpty {
                        Text("Nenhum produto encontrado")
                            .font(
                                .system(size: 20, weight: .ultraLight)
                            )
                            .foregroundColor(.gray)
                    } else {
                        ForEach(ListaDeProdutos.reversed()) { produto in
                            if produto.categoria == CategoriaSelecionada {
                                ItemView(produto: produto).padding()
                            }

                        }
                    }
                } else {
                    if ListaDeProdutos.isEmpty {
                        Text("Nenhum produto encontrado")
                            .font(
                                .system(size: 20, weight: .ultraLight)
                            )
                            .foregroundColor(.gray)
                    } else {
                        ForEach(ListaDeProdutos.reversed()) { produto in
                            ItemView(produto: produto).padding()
                        }
                    }
                }

            }  // Hstack
        }  // Scrollview
    }
}

#Preview {
    Home()
}
