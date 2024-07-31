import CoreLocation

// The LocationManager class conforms to NSObject and CLLocationManagerDelegate.
// It is responsible for managing location services, requesting location authorization, and providing the current location asynchronously.
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: Object to Access Location Services
    // The CLLocationManager object is used to start and stop the delivery of location-related events to your app.
    private let locationManager = CLLocationManager()
    
    // MARK: Set up the Location Manager Delegate
    // The init method sets the LocationManager instance as the delegate of CLLocationManager.
    // This means that this instance will handle the events related to location updates and authorization changes.
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // MARK: Request Authorization to access the User Location
    // This method checks the current authorization status for location services.
    // If the status is 'notDetermined', it requests 'When In Use' authorization from the user.
    func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            return
        }
    }
    
    // MARK: Continuation Object for the User Location
    // The continuation property is used to manage the asynchronous request for the current location.
    // It helps in resuming the execution with the retrieved location or an error.
    private var continuation: CheckedContinuation<CLLocation, Error>?
    
    // MARK: Async Request the Current Location
    // This computed property returns the current location asynchronously.
    // It uses Swift's concurrency features (async/await) to pause execution until the location is retrieved or an error occurs.
    var currentLocation: CLLocation {
        get async throws {
            return try await withCheckedThrowingContinuation { continuation in
                // 1. Set up the continuation object to resume execution later
                self.continuation = continuation
                // 2. Triggers the update of the current location
                locationManager.requestLocation()
            }
        }
    }
    
    // CLLocationManagerDelegate method that
    // CLLocationManagerDelegate method that handles location updates
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            continuation?.resume(returning: location)
            continuation = nil
        }
        
        // CLLocationManagerDelegate method that handles errors
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            continuation?.resume(throwing: error)
            continuation = nil
        }
        
       
    
}
