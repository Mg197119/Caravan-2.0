//
//  ContentView.swift
//  Caravan
//
//  Created by Mason Gill on 12/15/23.
//

import SwiftUI
import MapKit

var currentUser = User(displayName: "Mason", prefersDarkMode: true, favoriteColor: "Blue", age: 22)

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.499144, longitude: -81.703945), // Example coordinates (New York City)
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            
        )
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("ColorSet")
                    .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "bolt.fill") // Example symbol
                                .imageScale(.large) // Adjusts the scale of the image
                                .font(.system(size: 24)) // You can also use this to adjust the size
                                .padding()
                                .foregroundColor(Color("AccentColor"))
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        Text("Caravan")
                            .font(.custom("Bungee Shade", size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("AccentColor"))
                        
                        Spacer()
                        
                        NavigationLink(destination: ProfilePage(), label: {Image(systemName: "person.fill") // Example symbol
                                .imageScale(.large) // Adjusts the scale of the image
                                .font(.system(size: 24)) // You can also use this to adjust the size
                                .padding()
                                .foregroundColor(Color("AccentColor"))
                            .cornerRadius(10)})
                        
                            
                        
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 388, height: 608)
                            .cornerRadius(25)
                            .foregroundColor(Color(.black))
                            
                        Map(coordinateRegion: $region)
                            .frame(width: 380, height: 600) // You can adjust the size as needed
                        .cornerRadius(25)
                    }
                    
                    Spacer()
                    BottomBar
                        
                    
                }
//                NavigationLink(destination: ProfilePage(), label: {Text("Next Page")})
            }
        }
    }
    var BottomBar: some View{
        HStack{
            Button(action: {
                    // Action to perform when the button is tapped
                  }) {
                      Image(systemName: "person.2.fill") // Example symbol
                              .imageScale(.large) // Adjusts the scale of the image
                              .font(.system(size: 24)) // You can also use this to adjust the size
                          .padding()
                      .foregroundColor(Color("ColorSet"))
                      .cornerRadius(10)
                  }
            Spacer()
            
            Button(action: {
                    // Action to perform when the button is tapped
                  }) {
                      Image(systemName: "magnifyingglass") // Example symbol
                              .imageScale(.large) // Adjusts the scale of the image
                              .font(.system(size: 24)) // You can also use this to adjust the size
                          .padding()
                      .foregroundColor(Color("ColorSet"))
                      .cornerRadius(10)
                  }
            Spacer()
            Button(action: {
                    // Action to perform when the button is tapped
                  }) {
                      Image(systemName: "party.popper.fill") // Example symbol
                              .imageScale(.large) // Adjusts the scale of the image
                              .font(.system(size: 24)) // You can also use this to adjust the size
                          .padding()
                      .foregroundColor(Color("ColorSet"))
                      .cornerRadius(10)
                  }
            
            .frame(width: 100.0, height: 70.0)
            
        }
        .background(Color("AccentColor"))
        .cornerRadius(25)
        .edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal)
       
    }
        
}

#Preview {
    ContentView()
}
