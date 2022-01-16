//
//  ProductPage.swift
//  iOS Playground
//
//  Created by Marcupio on 1/16/22.
//

import SwiftUI

struct ProductPage: View {
    @State var heartPress: Bool = false
    @State var productImage: Image = Image("CokeCan")
    var body: some View {
        ZStack {
            Background()
            VStack {
                TopMenu()
                Product(productImage: $productImage)
                Spacer()
                    .frame(height: 50)
                BuyButton()
                Spacer()
                    .frame(height: 40)
                BottomInfo(heartPress: $heartPress)
                Spacer()
            }
        }
    }
}

struct Background: View {
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.purple.opacity(0.5))
                .offset(x: 100, y: -50)
                .frame(width: 300, height: 300)
                .glow(color: .purple, radius: 200)
            Circle()
                .foregroundColor(.red.opacity(0.5))
                .offset(x: -200, y: 40)
                .frame(width: 300, height: 300)
                .glow(color: .red, radius: 200)
            Circle()
                .foregroundColor(.orange.opacity(0.5))
                .offset(x: 150, y: 20)
                .frame(width: 300, height: 300)
                .glow(color: .orange, radius: 200)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
        VisualEffectView(effect: UIBlurEffect(style: .dark))
    }
}

struct TopMenu: View {
    var body: some View {
        HStack(spacing: 40) {
            Button(action: {}) {
                Image(systemName: "menucard")
                    .frame(width: 100, height: 100)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            Image(systemName: "bag.circle.fill")
                .frame(width: 130, height: 130)
                .font(.system(size: 60))
                .foregroundColor(.purple)
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .frame(width: 100, height: 100)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 50)
    }
}

struct Product: View {
    @Binding var productImage: Image
    var body: some View {
        ZStack {
            productImage
                .resizable()
                .frame(width: 300, height: 400)
                .blur(radius: 40)
            productImage
                .resizable()
                .frame(width: 300, height: 400)
                .cornerRadius(20)
        }
    }
}

struct BuyButton: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                ZStack {
                    Image(systemName: "creditcard.fill")
                        .frame(width: 300, height: 75, alignment: .leading)
                        .padding(.horizontal, 20)
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                        .background(.green.opacity(0.25))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 5)
                                .foregroundColor(.green)
                        )
                    Text("$1.00")
                        .frame(width: 300, alignment: .trailing)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .blur(radius: 5)
                    Text("$1.00")
                        .frame(width: 300, alignment: .trailing)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct BottomInfo: View {
    @Binding var heartPress: Bool
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Coca Cola")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Text("Refuel so you can do more, faster")
                }
                .foregroundColor(.white)
                Button {
                    heartPress.toggle()
                } label: {
                    if heartPress {
                        Image(systemName: "heart.fill")
                            .frame(width: 100, height: 100)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "heart")
                            .frame(width: 100, height: 100)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.black.opacity(0.5))
        .cornerRadius(20)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
