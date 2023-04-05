//
//  CreditsSheetView.swift
//  palera1nLoader
//
//  Created by Lakhan Lothiyi on 11/11/2022.
//

import IrregularGradient
import SwiftUI
import SDWebImageSwiftUI

let period: TimeInterval = 3

struct CreditsSheetView: View {
    
    @Binding var isOpen: Bool
    
    var credits: [Person] = [
        Person(name: "v4lex", icon: URL(string: "data:image/png;base64,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")!, role: "valera1n Loader", link: URL(string: "https://github.com/v4lex")!),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .irregularGradient(colors: palera1nColorGradients(), backgroundColor: palera1nColorGradients()[1], animate: true, speed: 0.5)
                    .blur(radius: 100)
                main
            }
        }
    }
    
    @ViewBuilder
    var main: some View {
        ScrollView {
            
            Button {
                guard let url = URL(string: "https://shoot.cf") else { return }
                UIApplication.shared.open(url)
            } label: {
                HStack {
                    Image("palera1n-white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 34)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Website")
                            .font(.title2.bold())
                        Text("shoot.cf")
                            .font(.caption)
                    }
                    Spacer()
                    
                    Image(systemName: "arrow.up.right.square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .padding(21)
                }
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(Capsule().foregroundColor(.init("CellBackground")).background(.ultraThinMaterial))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
            
            Button {
                guard let url = URL(string: "https://twitter.com/__valex__") else { return }
                UIApplication.shared.open(url)
            } label: {
                HStack {
                    Image(systemName: "message.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 28)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Twitter")
                            .font(.title2.bold())
                        Text("@__valex__")
                            .font(.caption)
                    }
                    Spacer()
                    
                    Image(systemName: "arrow.up.right.square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .padding(21)
                }
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(Capsule().foregroundColor(.init("CellBackground")).background(.ultraThinMaterial))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
            
            Button {
                guard let url = URL(string: "https://instagram.com/v4lex") else { return }
                UIApplication.shared.open(url)
            } label: {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Instagram")
                            .font(.title2.bold())
                        Text("@v4lex")
                            .font(.caption)
                    }
                    Spacer()
                    
                    Image(systemName: "arrow.up.right.square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .padding(21)
                }
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(Capsule().foregroundColor(.init("CellBackground")).background(.ultraThinMaterial))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
            
            HStack {
                Text("Credits")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
            .padding([.horizontal, .top])
            ForEach(credits) { person in
                PersonView(person)
            }
        }
        .navigationTitle("Socials")
    }
    
    @ViewBuilder
    func PersonView(_ person: Person) -> some View {
        Button {
            UIApplication.shared.open(person.link)
        } label: {
            HStack {
                WebImage(url: person.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(height: 80)
                
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.title.bold())
                    Text(person.role)
                        .font(.body)
                }
                
                Spacer()
                
                Image(systemName: "arrow.up.right.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .padding()
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Capsule().foregroundColor(.init("CellBackground")).background(.ultraThinMaterial))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
    }
}

struct Person: Identifiable {
    var id: String { link.absoluteString }
    let name: String
    let icon: URL
    let role: String
    let link: URL
}

struct CreditsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsSheetView(isOpen: .constant(true))
            .preferredColorScheme(.dark)
    }
}
