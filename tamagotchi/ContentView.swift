//
//  ContentView.swift
//  tamagotchi
//
//  Created by Luk'yanov, Mikhail (JMOB) on 24/01/2023.
//

import SwiftUI


    
struct ContentView: View {
    
    @State private var tamagotchi = Tamagotchi(name: "Migs", age: 0, hunger: 0, weight: 0.1, needForToilet: 0, health: 5, happiness: 5, discipline: 5)
    @State private var ageInSeconds = 0
    
    @State private var statToggle = false
    
    
    let timer = Timer.publish(every: 100, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Button("Show Stats") {
                    statToggle.toggle()
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 3)
                )
                
                if (statToggle) {
                    Text(tamagotchi.displayStats())
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            tamagotchi.age += 1
                            if tamagotchi.age > 50 {
                                
                            }
                        }
                }
                
                VStack {
                    HStack(spacing: 40) {
                        Button("Feed", action: {
                            if tamagotchi.hunger > 0 {
                                tamagotchi.hunger -= 1
                                tamagotchi.weight += 1
                            }
                            else {
                                tamagotchi.weight += 1
                            }
                        })
                            .foregroundColor(.green)
                        
                        Button("Discipline", action: {
                            tamagotchi.happiness -= 1
                            tamagotchi.discipline += 1
                        })
                            .foregroundColor(.green)
                        Button("Go toilet", action: {
                            tamagotchi.needForToilet = 0
                            tamagotchi.hunger += 1
                        })
                            .disabled(tamagotchi.needForToilet == 0 )
                            .foregroundColor(.green)
                    }

     
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

