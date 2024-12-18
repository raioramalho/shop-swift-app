//
//  CategoriesRollBar.swift
//  shop
//
//  Created by Alan Ramalho on 09/11/24.
//

import SwiftUI

struct CategoriesRollBar: View {
    @Binding var ListaDeCategorias: [Categoria]
    @Binding var CategoriaSelecionada: String

    var body: some View {
        // -------------- categorias

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ListaDeCategorias) { categoria in
                    Button(
                        action: {
                            CategoriaSelecionada = categoria.categoria
                        },
                        label: {
                            HStack {
                                Image(systemName: categoria.icon)
                                Text(categoria.categoria)
                                    .font(
                                        .system(
                                            size: 15, weight: .semibold,
                                            design: .rounded)
                                    ).foregroundStyle(.white)
                            }
                        }
                    )
                    .padding()
                    .background(
                        CategoriaSelecionada == categoria.categoria
                            ? .blue.opacity(0.6) : .blue.opacity(0.2)
                    )
                    .cornerRadius(25)
                    .foregroundColor(.orange)
                }
            }
            .scrollIndicators(.hidden)

        }  // --> ScrollView
    }

}
