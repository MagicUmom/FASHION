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
{
    bool btn_hot_clicked;
}
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
    
    self.camera = [GMSCameraPosition cameraWithLatitude:23.567241
                                              longitude:119.564565 zoom:14
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
    //
    NSMutableArray *demoArray = [NSMutableArray arrayWithObjects:@"scroll_demo_01",@"scroll_demo_02",@"scroll_demo_03",@"scroll_demo_04",@"scroll_demo_05",@"scroll_demo_06", nil] ;
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,550,375,117) imageNamesGroup:demoArray];
    [self.view addSubview:_cycleScrollView];
    _cycleScrollView.hidden= YES;
    self.cycleScrollView.delegate = self;
    btn_hot_clicked = NO;
}

- (void) viewWillAppear:(BOOL)animated
{
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

    
    if([[StoneSingleton shareSingletonObject] toHere ])
    {
        GMSMutablePath *path = [GMSMutablePath path];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567241,119.564565)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567443,119.564349)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567664,119.564376)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567647,119.565567)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567384,119.567876)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.567794,119.568288)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.569405,119.569744)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.570143,119.571364)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.571077,119.572533)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.571874,119.575269)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.572336,119.576310)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.572356,119.576857)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.571569,119.579067)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.569976,119.581846)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.569062,119.587433)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.568839,119.593442)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.569026,119.598442)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.572521,119.599978)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.578767,119.604234)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.586276,119.609281)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.591088,119.612945)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.595858,119.613241)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.600665,119.613232)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.606921,119.612223)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.610499,119.609734)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.612907,119.608393)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.614214,119.607824)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.615836,119.607320)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.617891,119.605829)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.619945,119.605625)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.622127,119.605443)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.625331,119.604445)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.626166,119.603919)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.628152,119.602277)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.630865,119.600646)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.632074,119.599605)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.632929,119.597545)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.633561,119.597204)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.637933,119.597115)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.641216,119.597212)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.643368,119.597641)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.645019,119.598049)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.650633,119.599829)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.654122,119.600001)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.657512,119.600570)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.659762,119.600334)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.662553,119.600119)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.665772,119.599926)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.666588,119.599347)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.666892,119.598177)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.666776,119.595150)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.666717,119.589764)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.666863,119.586802)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.667399,119.583042)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.667340,119.581991)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.665846,119.577506)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.664100,119.573259)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.662628,119.569879)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.659642,119.563722)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.660079,119.561949)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.661189,119.558677)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.661051,119.558108)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.660015,119.556974)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.657479,119.554031)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.650991,119.548413)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.642978,119.542284)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.638952,119.539533)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.638461,119.539190)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.636191,119.536218)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.636014,119.535510)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.637111,119.532118)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.637162,119.531760)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.636824,119.527952)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.636716,119.526901)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.637158,119.522647)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.636842,119.518575)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.635594,119.517062)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.634670,119.516225)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.632510,119.515196)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.629481,119.514420)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.622826,119.513459)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.619916,119.513094)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.617488,119.513480)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.615848,119.513957)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.614354,119.514762)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.611916,119.514826)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.609537,119.514483)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.606972,119.513881)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.604736,119.512317)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.602711,119.510858)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.600070,119.509847)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.597396,119.508688)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.594680,119.506538)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.593952,119.506248)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.590762,119.506190)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.588323,119.506603)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.587236,119.506176)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.586843,119.506176)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.585781,119.506380)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.585362,119.506501)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.584141,119.506058)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.582882,119.505672)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.581977,119.505543)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.580945,119.505758)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.580375,119.505855)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.579343,119.505458)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.579095,119.506062)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.579636,119.506867)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.580219,119.508362)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.580986,119.511012)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.579698,119.511624)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.578420,119.511098)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.576095,119.511560)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575702,119.511689)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575830,119.512236)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575378,119.513513)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575024,119.514543)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575280,119.515240)];
        [path addCoordinate:CLLocationCoordinate2DMake(23.575750,119.515444)];
        
        GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
        //polyline.spans = @[[GMSStyleSpan spanWithColor:[UIColor redColor]]];
        
        GMSStrokeStyle *solidRed = [GMSStrokeStyle solidColor:[UIColor redColor]];
        GMSStrokeStyle *solidBlue = [GMSStrokeStyle solidColor:[UIColor blueColor]];
        //GMSStrokeStyle *redYellow =[GMSStrokeStyle gradientFromColor:[UIColor redColor] toColor:[UIColor yellowColor]];
        polyline.spans = @[[GMSStyleSpan spanWithStyle:solidBlue segments:1],
                           [GMSStyleSpan spanWithStyle:solidRed segments:106],
                           [GMSStyleSpan spanWithStyle:solidBlue segments:10]];


        
        polyline.map = _mapView;
        
        _imageBar_bus.hidden = NO;
        _imageBar_text.hidden = NO;
        _imageBar_background.hidden = NO;
        _imageBar_line.hidden = NO;
        _out_btn_hot.hidden = YES;
    }
    else
    {
        _imageBar_background.hidden = YES;
        _imageBar_bus.hidden = YES;
        _imageBar_text.hidden = YES;
        _imageBar_line.hidden = YES;
        _out_btn_hot.hidden = NO;

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
    _cycleScrollView.hidden= YES;
    [self performSegueWithIdentifier:@"showDetail" sender:nil];

}

#pragma mark - btn method

- (IBAction)btn_hot:(id)sender
{
    btn_hot_clicked = !btn_hot_clicked;
    if(btn_hot_clicked) /// move up
    {
        UIButton *btn = (UIButton *)sender;
        btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y - 80, btn.frame.size.width, btn.frame.size.height);
        _cycleScrollView.hidden = NO;
    }
    else    ///move down
    {
        UIButton *btn = (UIButton *)sender;
        btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y + 80, btn.frame.size.width, btn.frame.size.height);
        _cycleScrollView.hidden = YES;
    }
}

#pragma mark - SDCycleScrollView method
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"SDCycleScrollView did click %ld",(long)index);
    GMSCameraPosition *sydney = [GMSCameraPosition cameraWithLatitude:23.575750
                                                            longitude:119.515444
                                                                 zoom:16];
    [_mapView animateToViewingAngle:30];
    [_mapView setCamera:sydney];

}
@end
