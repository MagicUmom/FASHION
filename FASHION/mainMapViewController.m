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

@implementation mainMapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView.myLocationEnabled = YES;
    _mapView.indoorEnabled = NO;
    _mapView.accessibilityElementsHidden = NO;

    // you must need user's gps location
    _mapView.myLocationEnabled = YES;
    _mapView.settings.compassButton = YES;
    _mapView.settings.myLocationButton = YES;
    
    self.camera = [GMSCameraPosition cameraWithLatitude:23.583822
                                              longitude:119.571729 zoom:14
                                                bearing:0
                                           viewingAngle:0
                   ];
    
    self.mapView = [GMSMapView mapWithFrame:_uiView_map.bounds camera:_camera];
    self.mapView.delegate = self;
    
    [self.uiView_map addSubview:_mapView];

    
    NSLog(@"User's location: %@", _mapView.myLocation);
    
    
    
    NSMutableArray *jsonArr = [StoneSingleton shareSingletonObject].stoneArray;
    for (NSMutableDictionary *tempArr in jsonArr)
    {
        GMSMarker *tempMarker = [[GMSMarker alloc]init];
        double lat = [[tempArr objectForKey:@"latitude"]doubleValue ];
        double longtitude = [[tempArr objectForKey:@"longitude"] doubleValue];
        tempMarker.position = CLLocationCoordinate2DMake(lat, longtitude);
        tempMarker.title = [tempArr objectForKey:@"name"];
        tempMarker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithRed:(76/255.f) green:(108/255.f) blue:(179/255.f) alpha:1.0]];
        tempMarker.userData = [tempArr objectForKey:@"id"];
        tempMarker.infoWindowAnchor = CGPointMake(0.5, 0.5);
        tempMarker.map = _mapView;

    }
}

- (void) viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(23.583822, 119.571729);
    GMSMarker *myLocat = [GMSMarker markerWithPosition:position];
    myLocat.title = @"My Location";
    
    //原始影像
    UIImage *image =[UIImage imageNamed:@"man.png"];
    //製作一個ImageContext並符合新的大小設定
    UIGraphicsBeginImageContext(CGSizeMake(40, 60));
    //將原始影像重繪在此範圍中
    [image drawInRect:CGRectMake(0, 0, 40, 60)];
    //以目前的ImageContext來製作新的UIImage
    UIImage *resizeImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    myLocat.icon = resizeImage;
    myLocat.map = _mapView;

    
    if([[StoneSingleton shareSingletonObject] toHere ])
    {
        GMSMutablePath *path = [GMSMutablePath path];
        [path addCoordinate:CLLocationCoordinate2DMake(23.583822, 119.571729)];
        //
        [path addCoordinate:CLLocationCoordinate2DMake(23.583175, 119.571419)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.582762, 119.572117)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.580864, 119.576698)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.579704, 119.579434)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.581420, 119.580420)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.583128, 119.580643)];
        //
        [path addCoordinate:CLLocationCoordinate2DMake(23.586229, 119.581674)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.589906, 119.582511)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.591459, 119.582822)];
        //
        [path addCoordinate:CLLocationCoordinate2DMake(23.591750, 119.582361)];
        
        GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
        //polyline.spans = @[[GMSStyleSpan spanWithColor:[UIColor redColor]]];
        
        GMSStrokeStyle *solidRed = [GMSStrokeStyle solidColor:[UIColor redColor]];
        GMSStrokeStyle *solidBlue = [GMSStrokeStyle solidColor:[UIColor blueColor]];
        //GMSStrokeStyle *redYellow =[GMSStrokeStyle gradientFromColor:[UIColor redColor] toColor:[UIColor yellowColor]];
        polyline.spans = @[[GMSStyleSpan spanWithStyle:solidBlue segments:1],
                           [GMSStyleSpan spanWithStyle:solidRed segments:6],
                           [GMSStyleSpan spanWithStyle:solidBlue segments:10]];


        
        polyline.map = _mapView;
        
        _imageBar_bus.hidden = NO;
        _imageBar_text.hidden = NO;
        _imageBar_background.hidden = NO;
        _imageBar_line.hidden = NO;
    }
    else
    {
        _imageBar_background.hidden = YES;
        _imageBar_bus.hidden = YES;
        _imageBar_text.hidden = YES;
        _imageBar_line.hidden = YES;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
