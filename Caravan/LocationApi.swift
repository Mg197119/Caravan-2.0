//
//  LocationApi.swift
//  Caravan
//
//  Created by Mason Gill on 8/11/24.
//

import Foundation
import CoreLocation

func sendLocationToServer(location: CLLocation) {
    let url = URL(string: "http://192.168.0.251:3000/api/locations")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let locationData = [
        "userName": "god",
        "lat": location.coordinate.latitude,
        "long": location.coordinate.longitude
    ] as [String : Any]

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: locationData, options: [])
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending location: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Location sent successfully")
            } else {
                print("Failed to send location")
            }
        }
        task.resume()
    } catch {
        print("Error serializing location data: \(error.localizedDescription)")
    }
}
