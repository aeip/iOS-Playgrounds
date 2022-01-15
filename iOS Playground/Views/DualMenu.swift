//
//  DualMenu.swift
//  iOS Playground
//
//  Created by Marcupio on 1/13/22.
//

import SwiftUI
import MarqueeText

struct DualMenu: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Scrollable Music Player View")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .padding()
                Spacer()
                    .frame(height: 20)
                Text("Some actions included...")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                Spacer()
            }
            Spacer()
            VStack {
                PlayerAndTabs()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PlayerAndTabs: View {
    var body: some View {
        Player()
        Divider()
        Tabs()
    }
}

struct Player: View {
    @State var opacity : Double = 1
    @State var height : CGFloat = 0
    @State var floating = false
    var body: some View {
        GeometryReader{geo in
            Group {
                if floating {
                    BottomPlayer()
                        .frame(width: .infinity, height: 75)
                        .background(.orange)
                        .cornerRadius(10)
                } else {
                    FullPlayer()
                }
            }
            .gesture(DragGesture()
                     
                        .onChanged({ (value) in
                
                
                if self.height >= 0{
                    
                    self.height += value.translation.height / 8
                    self.opacity = 0.5
                }
                
            })
                        .onEnded({ (value) in
                
                if self.height > 100 && !self.floating{
                    
                    self.height = geo.size.height - 75
                    self.opacity = 1
                    self.floating = true
                    
                }
                else{
                    
                    if self.height < geo.size.height - 150{
                        
                        self.height = 0
                        self.opacity = 1
                        self.floating = false
                    }
                    else{
                        
                        self.height = geo.size.height - 75
                        self.opacity = 1
                    }
                }
            })
                     
            ).opacity(self.opacity)
                .offset(y: self.height)
                .animation(.spring())
                .padding(6)
        }
    }
}

struct FullPlayer: View {
    @State var circleProgress: CGFloat = 0.0
    @State var heartPress: Bool = false
    @State var isPlaying: Bool = false
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            ZStack {
                Rectangle()
                    .stroke(Color.gray, lineWidth: 30)
                    .frame(width:275, height: 275)
                    .cornerRadius(10)
                Rectangle()
                    .trim(from: 0.0, to: circleProgress)
                    .stroke(Color.orange, lineWidth: 30)
                    .frame(width:275, height: 275)
                    .cornerRadius(10)
                    .rotationEffect(Angle(degrees: -90))
                Image("Album7")
                    .frame(width: 250, height: 250, alignment: .center)
                    .cornerRadius(10)
            }
            HStack {
                Text("0:00")
                Spacer()
                Text("3:14")
            }
            .foregroundColor(.white)
            .padding(.horizontal, 60)
            .padding(.vertical, 10)
            Spacer()
                .frame(height: 50)
            HStack {
                Button {
                    heartPress.toggle()
                } label: {
                    if heartPress {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 35))
                    } else {
                        Image(systemName: "heart")
                            .font(.system(size: 35))
                    }
                }
                Spacer()
                HStack {
                    MarqueeText(
                         text: "Spilled Orange Juice",
                         font: .systemFont(ofSize: 25, weight: .bold),
                         leftFade: 16,
                         rightFade: 16,
                         startDelay: 3,
                         alignment: .center
                         )
                        .foregroundColor(.orange)
                    Image(systemName: "e.square.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Button {
                    guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
                    let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                } label: {
                    Image(systemName: "shareplay")
                        .font(.system(size: 35))
                }
            }
            .foregroundColor(.orange)
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            HStack {
                Text("Larry June")
                    .padding(10)
                    .background(.orange)
                    .cornerRadius(10)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                Spacer()
                    .frame(width: 5)
                Text("HIP HOP/RAP · 2019")
                    .padding(10)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(.orange)
                    .font(.system(size: 12))
                    .padding(.horizontal, 30)
            }
            Spacer()
                .frame(height: 30)
            HStack {
                Button(action: {}) {
                    Image(systemName: "shuffle.circle.fill")
                }
                .padding()
                Spacer()
                HStack(spacing: 15) {
                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                    }
                    ZStack {
                        Circle()
                            .strokeBorder(
                                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                                lineWidth: 30
                            )
                            .blur(radius: 20)
                            .frame(width: 100, height: 100)
                        Button(action: {self.startLoading()}) {
                            if isPlaying {
                                Image(systemName: "pause.fill")
                            } else {
                                Image(systemName: "play.fill")
                            }
                        }
                        .font(.system(size: 50))
                    }
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "repeat")
                }
                .padding()
            }
            .tint(.white)
            .font(.system(size: 30))
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(
        Image("Album7")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .blur(radius: 40)
        )
        .cornerRadius(10)
    }
    func startLoading() {
        isPlaying.toggle()
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                if isPlaying {
                    self.circleProgress += 0.01
                }
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                    isPlaying.toggle()
                    circleProgress = 0.0
                }
            }
        }
    }
}

struct BottomPlayer: View {
    var body: some View {
        HStack(spacing: 16) { // Player
            Spacer()
            Image("Album7")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
                .shadow(radius: 5)
            Text("Spilled Orange Juice")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold, design: .rounded))
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.black)
            }
            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
}

struct Tabs: View {
    var body: some View {
        HStack { // Tabs
            Spacer()
            Image(systemName: "music.note.house.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: "airpodsmax")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: "hifispeaker.and.homepodmini.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: "gear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
        }.padding(16)
    }
}

struct DualMenu_Previews: PreviewProvider {
    static var previews: some View {
        DualMenu()
    }
}
