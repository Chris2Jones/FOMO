//
//  MapViewController.m
//  FOMO
//
//  Created by admin on 10/24/17.
//  Copyright © 2017 kahshe. All rights reserved.
//
#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController()
@property (weak, nonatomic) IBOutlet UIView *header;

@end

@implementation MapViewController

// You don't need to modify the default initWithNibName:bundle: method.

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
    [self setupHeader];
}


- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    [self.view bringSubviewToFront:self.header];
}

- (void)loadView {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:44.23
                                                            longitude:-76.48
                                                                 zoom:12];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(44.23, -76.48);
    marker.title = @"Kingston";
    marker.snippet = @"Ontario";
    marker.map = mapView;
}
@end
