//
//  GalleryView.swift
//  Africa
//
//  Created by Ranjan Akarsh on 10/06/21.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    // efficent grid definition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - GRID
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))

                // MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }
                } //: GRID
                .onAppear(perform: {
                    gridSwitch()
                })
                .animation(.easeIn)
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
