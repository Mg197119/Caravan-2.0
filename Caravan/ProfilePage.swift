//
//  Profile Page.swift
//  Caravan
//
//  Created by Mason Gill on 12/15/23.
//

import SwiftUI


struct ProfilePage: View {
    var body: some View {
        ZStack {
            Color("ColorSet")
                .ignoresSafeArea()
            

            
            VStack(alignment: .leading) { // Set VStack alignment to .top
                
                HStack {
                    Text("Mason") // Changed to "Mason" for demonstration
                        .font(Font.custom("GroovyBeach-Extrude", size: 38))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("AccentColor"))
                }
                
                Spacer() // This Spacer pushes the Text view to the top
            }
        }
    }
}

#Preview {
    ProfilePage()
}
