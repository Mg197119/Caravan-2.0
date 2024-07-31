//
//  ContentView.swift
//  Caravan
//
//  Created by Mason Gill on 12/15/23.
//

import SwiftUI
import MapKit
import CoreLocation
import Combine

var currentUser = User(displayName: "Mason", prefersDarkMode: true, favoriteColor: "Blue", age: 22)

struct ContentView: View {

   
    var locationManager = LocationManager()
    
    // MARK: Properties
    @State var location: CLLocation?
    
    // MARK: Position of the MapCamera
    @State private var position: MapCameraPosition = .automatic
    

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
                            .font(.custom("Bungee Shape", size: 30))
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
                            
                        Map(position: $position) {
                            UserAnnotation()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    .task {
                        // 1. Check if the app is authorized to access the location services of the device
                        locationManager.checkAuthorization()
                        await updateLocation()
                    }
                    
                    Spacer()
                    BottomBar
                        
                    
                }
//                NavigationLink(destination: ProfilePage(), label: {Text("Next Page")})
            }
        }
        
        
    }
    
    // MARK: Get the current user location if available
    func updateLocation() async {
        do {
            // 1. Get the current location from the location manager
            self.location = try await locationManager.currentLocation
            // 2. Update the camera position of the map to center around the user location
            self.updateMapPosition()
            
            if let location = self.location{
                sendLocationToServer(location: location)
            }
        } catch {
            print("Could not get user location: \(error.localizedDescription)")
        }
    }
    
    // MARK: Change the camera of the Map view
    func updateMapPosition() {
        if let location = self.location {
            let regionCenter = CLLocationCoordinate2D(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
            let regionSpan = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
                
            self.position = .region(MKCoordinateRegion(center: regionCenter, span: regionSpan))
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
