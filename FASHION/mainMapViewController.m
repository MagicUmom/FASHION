//
//  mainMapViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "mainMapViewController.h"
@import GoogleMaps;

@interface mainMapViewController ()

@end

@implementation mainMapViewController{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:23.6698 longitude:119.6000 zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.indoorEnabled = NO;
    mapView_.accessibilityElementsHidden = NO;

    // you must need user's gps location
    mapView_.myLocationEnabled = YES;
    mapView_.settings.compassButton = YES;
    mapView_.settings.myLocationButton = YES;
    
    NSLog(@"User's location: %@", mapView_.myLocation);

    self.view = mapView_;
    
    GMSMarker *marker = [[GMSMarker alloc]init];
    marker.position = CLLocationCoordinate2DMake(23.6700, 119.6021);
    marker.title = @"xxx";
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blackColor]];
    marker.snippet = @"Population: 8,174,100";
    marker.userData = @"101";
    marker.infoWindowAnchor = CGPointMake(0.5, 0.5);
    //marker.icon = [UIImage imagedName:@"defalut"];
    marker.map = mapView_;
    
    mapView_.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GMSMapViewDelegate
- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
}


- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    
    NSLog(@"tapped number : %@ marker ",marker.userData);
    [StoneSingleton shareSingletonObject].stoneKey = marker.userData;
    [StoneSingleton shareSingletonObject].stoneName = marker.title;
    [self performSegueWithIdentifier:@"showDetail" sender:nil];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
