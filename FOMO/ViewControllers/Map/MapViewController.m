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
@property (weak, nonatomic) IBOutlet GMSMapView *mapContainerView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self setupView];
}

- (void)setupView {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:44.2332813
                                                            longitude:-76.492527
                                                                 zoom:16];
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(44.2332813,-76.492527);
    marker.title = @"Kingston";
    marker.snippet = @"ON";
    marker.map = self.mapContainerView;
    self.mapContainerView.camera = camera;
    self.mapContainerView.myLocationEnabled = YES;
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

@end