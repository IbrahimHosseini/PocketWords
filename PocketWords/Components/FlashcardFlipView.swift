//
//  FlashcardFlipView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//
import SwiftUI

struct FlashcardFlipView: View {
    let isFlipped: Bool
    let word: String
    let meaning: String
    let cardIndex: Int
    let totalCards: Int
    let onTap: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Radius.medium)
                .fill(Color.white)
                .shadow(radius: Radius.mini)
            
            VStack(spacing: Spacing.small) {
                
                Text(isFlipped ? meaning : word)
                    .font(isFlipped ? .title : .largeTitle)
                    .bold()
                
                Text("Tap to flip")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .rotation3DEffect(.degrees(isFlipped ? Degree._180 : Degree._0), axis: (x: Axis._0, y: Axis._1, z: Axis._0))
        }
        .rotation3DEffect(.degrees(isFlipped ? Degree._180 : Degree._0), axis: (x: Axis._0, y: Axis._1, z: Axis._0))
        .animation(.easeInOut(duration: Duration.normal), value: isFlipped)
        .onTapGesture {
            onTap()
        }
        .padding(.horizontal)
    }
}
