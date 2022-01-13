//
//  LoginRegister.swift
//  iOS Playground
//
//  Created by Marcupio on 1/10/22.
//

import SwiftUI

struct LoginRegister: View {
@State private var animateGradient = false
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .strokeBorder(
                                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                                lineWidth: 35
                            )
                            .frame(width: 200, height: 200)
                            .shadow(color: Color(red: 0.27, green: 0.24, blue: 0.565), radius: 5, x: 0, y: 5)

                        Text("PHOTOS")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color(red: 0.89, green: 0.878, blue: 0.988))
                            .shadow(color: Color(red: 0.27, green: 0.24, blue: 0.565), radius: 5, x: 0, y: 0)

                    }
                }
            }
            Spacer()
            HStack {
                Button("LOG IN") {
                    print("Log in Pressed")
                }
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 150, height: 40)
                .border(.black, width: 2, cornerRadius: 5)
                
                Spacer()
                    .frame(width: 20)
                
                Button("REGISTER") {
                    print("Register Pressed")
                }
                .font(.system(size: 15))
                .foregroundColor(.white)
                .frame(width: 150, height: 40)
                .background(.black).clipped()
                .border(.black, width: 2, cornerRadius: 5)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 100,
                alignment: .bottom
              )
            .background(.white)
        }
        .background(LinearGradient(colors: [Color(red: 0.808, green: 0.623, blue: 0.988, opacity: 1.0), Color(red: 0.451, green: 0.4, blue: 0.941, opacity: 1.0)], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                        .ignoresSafeArea()
                        .onAppear {
                            withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                                animateGradient.toggle()
                            }
                        })
    }
}

extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
            .frame(width: 150, height: 40)
    }
}

struct LoginRegister_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegister()
    }
}
