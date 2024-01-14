//
//  ContentView.swift
//  Memorize
//
//  Created by Jeric Hernandez on 11/24/23.
//

import SwiftUI

// "behaves like a View" (or whatever protocol) Protocol Oriented Program
struct ContentView: View {
    enum Theme {
        case christmas
        case halloween
        case beach
    }

    // Computed Property the value of body is computed; what is inside the {}
    @State var emojis: [String] = []

    let christmasEmojis = ["🎄", "🎄", "🎅", "🎅", "🦌", "🦌", "🎁", "🎁", "❄️", "❄️", "⛄", "⛄"]
    let halloweenEmojis = ["🎃", "🎃", "👻", "👻", "🕸️", "🕸️", "🦇", "🦇", "🍬", "🍬", "🧙‍♀️", "🧙‍♀️"]
    let beachEmojis = ["🏖️", "🏖️", "🌊", "🌊", "🏄‍♂️", "🏄‍♂️", "🌴", "🌴", "🌞", "🌞", "⛱️", "⛱️"]

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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 5)], spacing: 5) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }

    @ViewBuilder
    func ThemeButton(theme: Theme) -> some View {
        Button(action: {
            switch theme {
            case .christmas:
                emojis = christmasEmojis.shuffled()
            case .halloween:
                emojis = halloweenEmojis.shuffled()
            case .beach:
                emojis = beachEmojis.shuffled()
            }
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
