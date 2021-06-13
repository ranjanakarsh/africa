//
//  CopyrightView.swift
//  Africa
//
//  Created by Ranjan Akarsh on 13/06/21.
//

import SwiftUI

struct CopyrightView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
                Copyright © Ranjan Akarsh
                All rights reserved
                Better Apps ♡ Less Code
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
