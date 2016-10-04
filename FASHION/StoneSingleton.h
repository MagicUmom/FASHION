//
//  StoneSingleton.h
//  FASHION
//
//  Created by MCLAB on 2016/10/3.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GoogleMaps;
@interface StoneSingleton : NSObject

+ (StoneSingleton*)shareSingletonObject;
@property(strong,nonatomic) NSString *stoneName;
@property(strong,nonatomic) NSString *stoneKey;
@property(strong,nonatomic) GMSMarker *stoneMarker;


@end
