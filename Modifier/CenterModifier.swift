//
//  CenterModifier.swift
//  Africa
//
//  Created by Ranjan Akarsh on 13/06/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
