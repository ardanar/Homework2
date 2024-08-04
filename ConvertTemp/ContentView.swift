//
//  ContentView.swift
//  ConvertTemp
//
//  Created by Arda Nar on 4.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var celciusText: String = ""
    @State var fahrenaytText: String = ""
    @State var isCel: Bool = true
    @State var type: String = "Celcius"
    
    var body: some View {
        VStack {
            HStack{
                if isCel == true{
                    VStack{
                        Text(type)
                            .font(.headline)
                        TextField("Celcius", text: $celciusText)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 30)
                            .background(Color.gray.opacity(0.1).shadow(radius: 5))
                            .cornerRadius(5)
                    }
                }else{
                    VStack{
                        Text(type)
                            .font(.headline)
                        TextField("Fahrenayt", text: $fahrenaytText)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 30)
                            .background(Color.gray.opacity(0.1).shadow(radius: 5))
                            .cornerRadius(5)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    if isCel == true{
                        isCel = false
                        type = "Fahrenayt"
                        fahrenaytText = ""
                    }else{
                        isCel = true
                        type = "Celcius"
                        celciusText = ""
                    }
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                })
                .padding(.top, 25)
                
                
                Spacer()
                
                if isCel == true{
                    if let doubleCel = Double(celciusText){
                        let doubleFah = (doubleCel * 1.8) + 32
                        let Fahtext = String(format: "%.2f", doubleFah)
                        Text("\(Fahtext) °F")
                            .padding(.top, 25)
                    }
                }else{
                    if let doubleFah = Double(fahrenaytText){
                        let doubleCel = (doubleFah - 32) / 1.8
                        let Celtext = String(format: "%.2f", doubleCel)
                        Text("\(Celtext) °C")
                            .padding(.top, 25)
                    }
                }
                
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
