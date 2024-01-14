//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jeric Hernandez on 11/24/23.
//

import SwiftUI

// "behaves like a View" (or whatever protocol) Protocol Oriented Program
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        Text("Memorize!").font(.largeTitle)
        VStack {
            ScrollView {
                Cards
            }
            Spacer()
            HStack {
                Spacer()
                ThemeButton(theme: .christmas)
                Spacer()
                ThemeButton(theme: .halloween)
                Spacer()
                ThemeButton(theme: .beach)
                Spacer()
            }
        }
        .padding()
    }

    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }

    @ViewBuilder
    func ThemeButton(theme: Theme) -> some View {
        Button(action: {
            viewModel.changeTheme(to: theme)
        }, label: {
            VStack {
                Image(systemName: systemImageName(for: theme)).font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                Text(String(describing: theme)).font(.subheadline)
            }

        })
    }

    private func systemImageName(for theme: Theme) -> String {
        switch theme {
        case .christmas:
            return "snowflake"
        case .halloween:
            return "moon.stars.fill"
        case .beach:
            return "sun.max"
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
