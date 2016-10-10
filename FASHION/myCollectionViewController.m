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
    self.camera = [GMSCameraPosition cameraWithLatitude:23.567241
                                              longitude:119.564565 zoom:14
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
            tempMarker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:(238/255.f) green:(120/255.f) blue:(0/255.f) alpha:1.0]];

        }
        else
        {
            tempMarker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:(76/255.f) green:(108/255.f) blue:(179/255.f) alpha:1.0]];
        }
        tempMarker.userData = [tempArr objectForKey:@"id"];
        tempMarker.infoWindowAnchor = CGPointMake(0.5, 0.5);
        tempMarker.map = _mapView;
        
    }

    
    // MyLocation
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(23.567241, 119.564565);
    GMSMarker *myLocat = [GMSMarker markerWithPosition:position];
    myLocat.title = @"My Location";
    
    //原始影像
    UIImage *image =[UIImage imageNamed:@"man_icon.png"];
    //製作一個ImageContext並符合新的大小設定
    UIGraphicsBeginImageContext(CGSizeMake(40, 60));
    //將原始影像重繪在此範圍中
    [image drawInRect:CGRectMake(0, 0, 40, 60)];
    //以目前的ImageContext來製作新的UIImage
    UIImage *resizeImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    myLocat.icon = resizeImage;
    myLocat.map = _mapView;

    //
    
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
