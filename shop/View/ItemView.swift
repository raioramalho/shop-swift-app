import SwiftUI

struct ItemView: View {
    var produto: Produto
    
    // Variável de estado para armazenar a imagem baixada
    @State private var downloadedImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            if let uiImage = downloadedImage {
                // Exibe a imagem baixada
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
//                    .frame(width: 380, height: 400)
                    .clipped()
            } else {
                // Placeholder enquanto a imagem carrega
                Color.gray.opacity(0.2)
                    .frame(width: 380, height: 460)
            }
            
            Text(produto.produto)
                .font(
                    .system(size: 180, weight: .ultraLight, design: .rounded)
                )
                .foregroundColor(.white)
                .shadow(color: .orange.opacity(0.5), radius: 5, x: 0, y: 5)
                .padding(.top, 20)
        }
        .frame(width: 380, height: 460)
        .background(
            .ultraThinMaterial.opacity(1.0)
        )
        .cornerRadius(40)
        .shadow(color: .white.opacity(0.2), radius: 5, x: 3, y: 3)
        .onAppear {
            // Baixa a imagem ao aparecer a view
            BuscarImagem(from: produto.imagem) { imagem in
                downloadedImage = imagem
            }
        }
    }
}


#Preview {
    Home()
}

