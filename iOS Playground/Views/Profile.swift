//
//  Profile.swift
//  iOS Playground
//
//  Created by Marcupio on 1/10/22.
//

import SwiftUI

struct Profile: View {
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var x: CGFloat = 0
    var body: some View {
        VStack {
            Group { // Profile Section 1
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 130, height: 130)
                        .foregroundColor(.pink)
                        .overlay(
                            Circle()
                            
                                .stroke(style: StrokeStyle(lineWidth: 5, dash: [x+5], dashPhase: x))
                                .frame(width: 140, height: 140, alignment: .center)
                                .onAppear {
                                    withAnimation(.linear.repeatForever(autoreverses: false)) {
                                        x -= 10
                                    }
                                }
                                .foregroundColor(.pink)
                            
                        )
                    Image("ReadyPlayerMe-Avatar")
                        .resizable()
                        .frame(width: 110, height: 110, alignment: .top)
                        .offset(y:-10)
                }
                Spacer()
                    .frame(height: 20)
                VStack {
                    Text("Stasys Meclazcke")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                    Text("Austin, Texas")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(.pink)
                }
                Spacer()
                    .frame(height: 20)
            }
            Group { // Profile Section 2
                VStack {
                    HStack(spacing: 30) {
                        VStack {
                            Text("1k")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            Text("Following")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(.pink)
                        }
                        VStack {
                            Text("100k")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            Text("Followers")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(.pink)
                        }
                        VStack {
                            Text("1.2m")
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            Text("Likes")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(.pink)
                        }
                    }
                }
                Spacer()
                    .frame(height: 20)
                HStack(spacing: 50) {
                    Button {
                        print("Following Button Pressed")
                    } label: {
                        Label("Following", systemImage: "person.crop.circle.badge.minus")
                            .padding(.horizontal, 40)
                            .padding(.vertical)
                    }
                    .tint(.pink)
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    Button {
                        print("Messaging Button Pressed")
                    } label: {
                        Image(systemName: "message")
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer()
                    .frame(height: 20)
            }
            Group { // Profile Section 3
                HStack {
                    Button {
                        print("Shared Button Pressed")
                    } label: {
                        Text("Shared")
                            .frame(maxWidth: .infinity)
                            .tint(.black)
                    }
                    Button {
                        print("Albums Button Pressed")
                    } label: {
                        Text("Albums")
                            .frame(maxWidth: .infinity)
                            .tint(.black)
                    }
                    Button {
                        print("Playlists Button Pressed")
                    } label: {
                        Text("Playlists")
                            .frame(maxWidth: .infinity)
                            .tint(.black)
                    }
                    Button {
                        print("More Button Pressed")
                    } label: {
                        Image(systemName: "ellipsis")
                            .frame(maxWidth: .infinity)
                            .tint(.black)
                    }
                }
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                Spacer()
                    .frame(height: 20)
                ScrollView {
                    Spacer()
                        .frame(height: 20)
                    LazyVGrid(columns: threeColumnGrid, spacing: 30) {
                        VStack {
                            Image("Album1")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .pink, radius: 18)
                            
                            Text("Orange Print")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.pink)
                                .cornerRadius(10)
                                .glow(color: .pink, radius: 18)
                        }
                    
                        VStack {
                            Image("Album2")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .green, radius: 18)
                            Text("Game Related")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.green)
                                .cornerRadius(10)
                                .glow(color: .green, radius: 18)
                        }
                        VStack {
                            Image("Album3")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .red, radius: 18)
                            Text("Cruise USA")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(10)
                                .glow(color: .red, radius: 18)
                        }
                        VStack {
                            Image("Album4")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .blue, radius: 18)
                            Text("Adjust To The Game")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
                                .glow(color: .blue, radius: 18)
                        }
                        VStack {
                            Image("Album5")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .orange, radius: 18)
                            Text("Out The Trunk")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.orange)
                                .cornerRadius(10)
                                .glow(color: .orange, radius: 18)
                        }
                        VStack {
                            Image("Album6")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .glow(color: .black, radius: 18)
                            Text("The Port Of San Franisco")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.black)
                                .cornerRadius(10)
                                .glow(color: .black, radius: 18)
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
