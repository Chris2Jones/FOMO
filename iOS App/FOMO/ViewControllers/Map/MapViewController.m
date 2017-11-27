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
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    
    GMSMarker *pre = [[GMSMarker alloc] init];
    GMSMarker *houseJam = [[GMSMarker alloc]init];
    
    pre.position = CLLocationCoordinate2DMake(44.2341526, -76.4941664);
    houseJam.position = CLLocationCoordinate2DMake(44.2316917, -76.4978805);
    
    pre.title = NSLocalizedString(@"David's pre", nil);
    houseJam.title = NSLocalizedString(@"Rastislav's jam", nil);
    
    marker.position = CLLocationCoordinate2DMake(44.2332813,-76.492527);
    marker2.position = CLLocationCoordinate2DMake(44.232849,-76.4929419);
    marker3.position = CLLocationCoordinate2DMake(44.233021,-76.4919934);
    marker4.position = CLLocationCoordinate2DMake(44.233345,-76.4937106);
    marker.title = @"Kingston";
    marker.snippet = @"ON";
    marker2.title = @"Stages";
    marker3.title = @"Alehouse";
    marker4.title = @"Trinity";
    marker.map = self.mapContainerView;
    marker2.map = self.mapContainerView;
    marker3.map = self.mapContainerView;
    marker4.map = self.mapContainerView;
    
    pre.map = self.mapContainerView;
    houseJam.map = self.mapContainerView;
    
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
