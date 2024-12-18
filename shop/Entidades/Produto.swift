//
//  Produto.swift
//  shop
//
//  Created by Alan Ramalho on 05/11/24.
//

import Foundation

struct Produto: Identifiable, Hashable, Decodable {
    var id: Int
    var produto: String
    var categoria: String
    var imagem: String
}
