//
//  BuscarImagem.swift
//  shop
//
//  Created by Alan Ramalho on 07/11/24.
//

import Foundation
import SwiftUI

func BuscarImagem(from urlString: String, completion: @escaping (UIImage?) -> Void) {
    guard let url = URL(string: urlString) else {
        print("URL inválida")
        completion(nil)
        return
    }
    
    // Cria uma tarefa de download
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Erro ao baixar a imagem: \(error)")
            completion(nil)
            return
        }
        
        // Verifica se os dados foram recebidos e converte para UIImage
        if let data = data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                completion(image)
            }
        } else {
            print("Dados da imagem estão inválidos ou falha ao converter para UIImage")
            completion(nil)
        }
    }.resume() // Inicia o download
}
