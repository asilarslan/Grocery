//
//  MapView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.022859, longitude: 28.977357),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: true)
        
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 41.022859, longitude: 28.977357)
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 41.010695, longitude: 28.977469)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
        sourcePin.title = "Destination"
        mapView.addAnnotation(sourcePin)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destinationCoordinate
        destinationPin.title = "Source"
        mapView.addAnnotation(destinationPin)
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        
        req.transportType = .automobile
        
        let directions = MKDirections(request: req)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(named: "ColorPrimary")
            renderer.lineWidth = 5
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, viewFor
                        annotation: MKAnnotation) -> MKAnnotationView?{
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
               //  annotationView.glyphTintColor = UIColor.black
               switch annotation.title!! {
                   case "Source":
                       annotationView.markerTintColor = UIColor(named: "ColorSource")
                    annotationView.glyphImage = UIImage(systemName: "house")
                    annotationView.selectedGlyphImage = UIImage(systemName: "house")
                   case "Destination":
                       annotationView.markerTintColor = UIColor(named: "ColorDestination")
                    annotationView.glyphImage = UIImage(systemName: "bag")
                   default:
                       annotationView.markerTintColor = UIColor.blue
               }
               return annotationView
        }
    }
}


