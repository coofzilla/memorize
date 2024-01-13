//
//  ContentView.swift
//  Memorize
//
//  Created by Jeric Hernandez on 11/24/23.
//

import SwiftUI

// "behaves like a View" (or whatever protocol) Protocol Oriented Program
struct ContentView: View {
    // Computed Property the value of body is computed; what is inside the {}
    let emojis = ["👻", "🎃", "🕷️", "👺", "💥", "💅", "🧹", "🍬", "😈", "🧟‍♂️", "💀"]
    @State var cardCount = 4

    var body: some View {
        VStack {
            Cards
            CardAdjusters
        }
        .padding()
    }

    var CardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        })
    }

    var CardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }

    var Cards: some View {
        HStack {
            ForEach(0 ..< cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }

    var CardAdjusters: some View {
        HStack {
            CardAdder
            Spacer()
            CardRemover
        }
        .imageScale(.large)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String

    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
