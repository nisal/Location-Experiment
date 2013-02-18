//
//  ViewController.m
//  locationExperiment
//
//  Created by Clarice on 22/01/13.
//  Copyright (c) 2013 Omkar Nisal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

@synthesize show;
@synthesize other;
@synthesize myMapView;
int cl=0,cla=0;
- (void)viewDidLoad
{
    
     [super viewDidLoad];
//    show.text = @"this is show";
//    other.text = @"This is other";

    
    [self clarice:nil];


	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)current:(id)sender {
    
       locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (IBAction)clarice:(id)sender {
    
    myMapView.mapType = MKMapTypeHybrid;
    
    MKCoordinateRegion newRegion1;
    
    
    newRegion1.center.latitude =  18.555258;
    newRegion1.center.longitude = 73.797384;

    cla++;
    
    if(cla==1)
    {
        newRegion1.span.latitudeDelta = 180;
        newRegion1.span.longitudeDelta = 360;
        
    }
    else if(cla==2)
    {
        newRegion1.span.latitudeDelta = 9;
        newRegion1.span.longitudeDelta = 18;
        
    }
    else if(cla==3)
    {
        newRegion1.span.latitudeDelta = 1.8;
        newRegion1.span.longitudeDelta = 3.6;
        
    }
    else if(cla==4)
    {
        newRegion1.span.latitudeDelta = 0.180;
        newRegion1.span.longitudeDelta = 0.360;
    }
    else if(cla==5)
    {
        newRegion1.span.latitudeDelta = 0.0135;
        newRegion1.span.longitudeDelta = 0.0238;
    }
    
    else if(cla==6)
    {
        newRegion1.span.latitudeDelta = 0.001355;
        newRegion1.span.longitudeDelta = 0.002387;
        cla = 0;
    }
    
    
    
    
    [self.myMapView setRegion:newRegion1 animated:YES];
    
}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    int degrees = newLocation.coordinate.latitude;
    double decimal = fabs(newLocation.coordinate.latitude - degrees);
    int minutes = decimal * 60;
    double seconds = decimal * 3600 - minutes * 60;
    NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                     degrees, minutes, seconds];
    
    
    show.text = lat;
    degrees = newLocation.coordinate.longitude;
    decimal = fabs(newLocation.coordinate.longitude - degrees);
    minutes = decimal * 60;
    seconds = decimal * 3600 - minutes * 60;
    NSString *longt = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                       degrees, minutes, seconds];
    other.text = longt;
    
    myMapView.mapType = MKMapTypeHybrid;
    MKCoordinateRegion newRegion;
    
    double d = 0.21334;
    
    newRegion.center.latitude = [lat doubleValue]+d ;//35.710838;
    newRegion.center.longitude = [longt doubleValue]+d;//-105.908203;

    
    cl++;
    
    if(cl==1)
    {
        newRegion.span.latitudeDelta = 180;
        newRegion.span.longitudeDelta = 360;
        
    }
    else if(cl==2)
    {
        newRegion.span.latitudeDelta = 9;
        newRegion.span.longitudeDelta = 18;
        
    }
    else if(cl==3)
    {
        newRegion.span.latitudeDelta = 3;
        newRegion.span.longitudeDelta = 7;
        
    }
    else if(cl==4)
    {
        newRegion.span.latitudeDelta = 1.80;
        newRegion.span.longitudeDelta = 3.60;
    }
    else if(cl==5)
    {
        newRegion.span.latitudeDelta = 0.921;
        newRegion.span.longitudeDelta = 0.190;
    }
    
    else if(cl==6)
    {
        newRegion.span.latitudeDelta = 0.09217;
        newRegion.span.longitudeDelta = 0.019097;
        
        cl = 0;
    }
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [lat doubleValue]+d;//35.710838;
    coordinate.longitude = [longt doubleValue]+d;// -105.908203;
    
    MKPointAnnotation *annotation =  [[MKPointAnnotation alloc]init];
    [annotation setCoordinate:coordinate];
    
    [annotation setSubtitle:@"Omee is the best!"];
    [annotation setTitle:@" Omkar Nisal"];
    
    [self.myMapView addAnnotation:annotation];
    [self.myMapView setRegion:newRegion  animated:YES];
    
    [locationManager stopUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
