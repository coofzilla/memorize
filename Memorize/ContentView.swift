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
    let emojis = ["👻", "🎃", "🕷️", "👺", "💥", "💅", "🧹", "🍬", "😈", "🧟‍♂️", "💀", "🐧"]
    @State var cardCount = 4

    var body: some View {
        VStack {
            ScrollView {
                Cards
            }
            Spacer()
            CardAdjusters
        }
        .padding()
    }

    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var CardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }

    var CardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }

    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0 ..< cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
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
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
