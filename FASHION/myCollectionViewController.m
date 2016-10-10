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

@implementation myCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _mapView.indoorEnabled = NO;
    _mapView.accessibilityElementsHidden = NO;
    
    // you must need user's gps location
    _mapView.myLocationEnabled = YES;
    _mapView.settings.compassButton = YES;
    _mapView.settings.myLocationButton = YES;
    ///
    self.camera = [GMSCameraPosition cameraWithLatitude:23.583822
                                              longitude:119.571729 zoom:14
                                                bearing:0
                                           viewingAngle:0
                   ];
    
    self.mapView = [GMSMapView mapWithFrame:_uiView_map.bounds camera:_camera];
    self.mapView.delegate = self;
    
    [self.uiView_map addSubview:_mapView];

    ///
    NSLog(@"User's location: %@", _mapView.myLocation);
    //_uiView_map = _mapView;
    //self->_mapView.delegate = self;
    
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
        tempMarker.map = _mapView;
        
    }

    _collect_label_count.text = [NSString stringWithFormat:@"%lu", (unsigned long)[[StoneSingleton shareSingletonObject].myCollecttion count]];
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
    /*
    [StoneSingleton shareSingletonObject].stoneKey = marker.userData;
    [StoneSingleton shareSingletonObject].stoneName = marker.title;
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
    */
}

@end
