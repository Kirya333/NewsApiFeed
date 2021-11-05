//
//  ArticleDetailView.swift
//  NewsApiFeed
//
//  Created by Кирилл Тарасов on 05.11.2021.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct ArticleDetailView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image("news_placeholder").resizable()
                .frame(height: 300, alignment: .center)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 5) {
                Text("Some Text ")
                    .font(.headline)
                    
                Text("Some description ")
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            Button("Open in Safari") {
                
            }
            Spacer()
        }
    }
}

@available(iOS 13.0.0, *)
struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView()
    }
}
