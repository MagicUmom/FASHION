//
//  myCollectionViewController.m
//  FASHION
//
//  Created by MCLAB on 2016/9/29.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "myCollectionViewController.h"
@import GoogleMaps;

@interface myCollectionViewController ()

@end

@implementation myCollectionViewController{
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
    mapView_.delegate = self;
    
    NSMutableArray *jsonArr = [StoneSingleton shareSingletonObject].stoneArray;
    for (NSMutableDictionary *tempArr in jsonArr)
    {
        GMSMarker *tempMarker = [[GMSMarker alloc]init];
        double lat = [[tempArr objectForKey:@"latitude"]doubleValue ];
        double longtitude = [[tempArr objectForKey:@"longitude"] doubleValue];
        tempMarker.position = CLLocationCoordinate2DMake(lat, longtitude);
        tempMarker.title = [tempArr objectForKey:@"name"];
        NSString *tempString = [tempArr objectForKey:@"id"];
        //NSLog(@"%@",[StoneSingleton shareSingletonObject].myCollecttion );
        if ([[StoneSingleton shareSingletonObject].myCollecttion containsObject:tempString])
        {
            tempMarker.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];

        }
        else
        {
            tempMarker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
        }
        tempMarker.userData = [tempArr objectForKey:@"id"];
        tempMarker.infoWindowAnchor = CGPointMake(0.5, 0.5);
        tempMarker.map = mapView_;
        
    }

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

@end
