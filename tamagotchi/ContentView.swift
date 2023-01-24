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
    
    let timer = Timer.publish(every: 100, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            Text(tamagotchi.displayStats())
                .onReceive(timer) { _ in
                    tamagotchi.age += 1
                    if tamagotchi.age > 50 {
                        
                    }
                    
                }
                .padding()
            Button("Show Stats") {
                .toggle
            }
            if
            
            HStack {
                Button("Feed", action: {
                    if tamagotchi.hunger > 0 {
                        tamagotchi.hunger -= 1
                        tamagotchi.weight += 1
                    }
                    else {
                        tamagotchi.weight += 1
                    }
                })
                Button("Discipline", action: {
                    tamagotchi.happiness -= 1
                    tamagotchi.discipline += 1
                })

 
            }
        }
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
