//
//  ContentView.swift
//  ZigzagConversion
//
//  Created by Hager Elsayed on 28/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ZigzagConvertorViewModel = ZigzagConvertorViewModel()
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ZigzagShape()
                        .frame(width: 90, height: 90)
                    
                    Text("igzag Conversion")
                        .font(.title)
                        .padding(.top, 40)
                        .foregroundColor(Color.zigzagPrimaryFontColor)
                    
                }
                .padding()
                .padding(.top, 20)
                
                HStack {
                    Image(systemName: "textbox")
                        .foregroundColor(.black)
                        .padding()
                    TextField("Enter a string ..", text: $viewModel.text)
                }
                .background(Color.white)
                .cornerRadius(30)
                .padding(.horizontal, 25)
                .padding(.vertical)
                
                HStack {
                    Image(systemName: "list.number")
                        .foregroundColor(.black)
                        .padding()
                    TextField("Enter Number of rows", text: $viewModel.numRows)
                }
                .background(Color.white)
                .cornerRadius(30)
                .padding(.horizontal, 25)
                .padding(.vertical)
                
                
                Button(action: {
                    viewModel.getZigzagText()
                }) {
                    Text("Done")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: UIScreen.main
                        .bounds.width / 1.1)
                .background(Color.zigzagPrimaryColor)
                .cornerRadius(35)
                .padding()
                
                if !viewModel.zigzagConversionResult.isEmpty {
                    Text(viewModel.zigzagConversionResult)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(Color.zigzagPrimaryFontColor)
                }
                
                Text(viewModel.message)
                    .font(.title)
                    .foregroundColor(Color.red)
                
            }
        }
        .background(Color.zigzagBackgroundColor)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct ZigzagShape: View {
    @State private var percentage: CGFloat = .zero
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 60, y: 0))
            path.addLine(to: CGPoint(x: 60, y: 60))
            path.addLine(to: CGPoint(x: 20, y: 0))
            path.addLine(to: CGPoint(x: 20, y: 60))
            
        }
        .rotation(.degrees(270))
        .trim(from: 0, to: percentage)
        .stroke(lineWidth: 8)
        .fill(LinearGradient(
            gradient: Gradient(colors: [Color.zigzagPrimaryColor, Color.zigzagPrimaryFontColor]),
            startPoint: .trailing,
            endPoint: .leading)
        )
        .animation(.easeOut(duration: 2.0), value: percentage)
        
        .onAppear {
            self.percentage = 1.0
        }
        .padding(.trailing, -40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
