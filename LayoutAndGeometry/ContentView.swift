//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Tien Bui on 16/7/2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

        var body: some View {
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(Color(
                                    hue: min(1 , geo.frame(in: .global).minY / fullView.size.height),
                                    saturation: 1,
                                    brightness: 1
                                ))
                                .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                                .opacity(geo.frame(in: .global).minY / 200)
                                .onTapGesture {
                                    print(1 - Double(59 / geo.frame(in: .global).minY))
                                }
                                .scaleEffect(max(0.5, 1 - Double(59 / geo.frame(in: .global).minY)))
                        }
                        .frame(height: 40)
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
