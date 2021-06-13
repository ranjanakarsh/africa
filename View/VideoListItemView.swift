//
//  VideoListItem.swift
//  Africa
//
//  Created by Ranjan Akarsh on 11/06/21.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let video: Video

    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(self.video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: STACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(self.video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(self.video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEw
struct VideoListItem_Previews: PreviewProvider {
    static let video: [Video] = Bundle.main.decode("videos.json")

    static var previews: some View {
        VideoListItemView(video: video[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
