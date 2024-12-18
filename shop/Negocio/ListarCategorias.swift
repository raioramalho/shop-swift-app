//
//  ListarCategorias.swift
//  shop
//
//  Created by Alan Ramalho on 06/11/24.
//

import Foundation

func ListarCategorias(completion: @escaping ([Categoria]?, Error?) -> Void) {
    let url = URL(string: "https://anotaai-mock-produto.ramalho.workers.dev/categoria")!
    var request = URLRequest(url: url, timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil, error)
            return
        }
        
        do {
            let categorias = try JSONDecoder().decode([Categoria].self, from: data)
            completion(categorias, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    task.resume()
}
