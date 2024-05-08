//
//  ContentView.swift
//  Created by GaliSrikanth on 08/05/24.

import SwiftUI

struct ContentView: View {
    @State private var isSubscribed = false
    @State private var isAnimatingCircle = false
    @State private var isAnimatingButton = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.red, Color.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(spacing: 30) {
                //Annual Subscription
                HStack(spacing: 0) {
                    Text("Annual subscription")
                        .bold()
                        .opacity(isSubscribed ? 1.0 : 0.5)
                    
                    Spacer()
                    
                    Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 24))
                        .scaleEffect(isSubscribed ? 1.25 : 1.0)
                        .foregroundColor(isSubscribed ? Color.purple : Color.black)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isSubscribed.toggle()
                            }
                        }
                }
                .padding(5)
                .padding(.leading, 20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.horizontal, 30)
                
                
                //Bouncy circle
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.cyan, .green], startPoint: .topTrailing, endPoint: .bottomLeading))
                    .offset(x: isAnimatingCircle ? 0 : 0, y: isAnimatingCircle ? 100 : 0)
                    .scaleEffect(isAnimatingCircle ? 1.25 : 1.0)
                    .onTapGesture {
                        withAnimation(
                            .spring(response: 1.0, dampingFraction: 1.0, blendDuration: 0.0)) {
                            isAnimatingCircle.toggle()
                        }
                    }
                
                //Animate button
                Button {
                    withAnimation(.easeInOut(duration: 1.0).repeatCount(3)) {
                        isAnimatingButton.toggle()
                    }
                } label: {
                    Text("Animate")
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.indigo)
                        .background(LinearGradient(colors: [.mint, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 3)
                        .opacity(isAnimatingButton ? 1.0 : 0.7)
                        .scaleEffect(isAnimatingButton ? 1.5 : 1.0)
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
