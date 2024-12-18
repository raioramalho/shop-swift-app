//
//  Home.swift
//  shop
//
//  Created by Alan Ramalho on 25/10/24.
//

import SwiftUI

struct Home: View {

    @State private var ListaDeCategorias: [Categoria] = [
        Categoria(id: 1, categoria: "Carregando", icon: "network")
    ]
    @State private var ListaDeProdutos: [Produto] = [
        Produto(
            id: 1, produto: "Carregando produtos", categoria: "Carregando",
            imagem: "")
    ]
    @State private var CategoriaSelecionada: String = "Todos"
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header

                    HStack {
                        Text("Sua vida se move quando tem **Música**")
                            .multilineTextAlignment(.leading)
                            .font(
                                .system(
                                    size: 36,
                                    weight: .thin,
                                    design: .rounded
                                )
                            )
                            .padding(.trailing)

                        Button(
                            action: {
                                print("clicked")
                            },
                            label: {
                                Image(systemName: "cart.fill")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 100, height: 130)
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 30
                                        )
                                        .stroke()
                                        .opacity(0.4)
                                    )
                                    .foregroundColor(.orange)
                            })

                    }  // --> HStack

                }  // --> VStack
                .padding()

                CategoriesRollBar(
                    ListaDeCategorias: $ListaDeCategorias,
                    CategoriaSelecionada: $CategoriaSelecionada
                )

                Spacer(minLength: 18)

                // Section Category
                HStack {
                    Text(CategoriaSelecionada)
                        .font(
                            .system(size: 25, weight: .thin, design: .rounded)
                        )
                        .shadow(
                            color: .orange.opacity(0.5), radius: 5, x: 0, y: 5)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }.padding()
                
                ProductsRollCard(
                    ListaDeProdutos: $ListaDeProdutos,
                    CategoriaSelecionada: $CategoriaSelecionada
                )

            }
            .onAppear {
                print("Home carregada.")
                DispatchQueue.main.async {
                    loadCategorias()
                    loadProdutos()
                }
            }
            .refreshable(action: {
                print("reloading!!")
                loadCategorias()
                loadProdutos()
            })
        }
    }

    private func loadCategorias() {
        ListarCategorias { categorias, error in
            if let error = error {
                print("Erro ao carregar categorias: \(error)")
            } else if let categorias = categorias {
                DispatchQueue.main.async {
                    ListaDeCategorias = categorias
                }
            }
        }
    }
    private func loadProdutos() {
        ListarProdutos { produtos, error in
            if let error = error {
                print("Erro ao carregar produtos: \(error)")
            } else if let produtos = produtos {
                DispatchQueue.main.async {
                    ListaDeProdutos = produtos
                }
                
                
            }
        }
    }

}

#Preview {
    Home()
}
