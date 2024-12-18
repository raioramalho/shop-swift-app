//
//  Categoria.swift
//  shop
//
//  Created by Alan Ramalho on 02/11/24.
//

import Foundation

struct Categoria: Identifiable, Hashable, Decodable {
    var id: Int
    var categoria: String    
    var icon: String
}
