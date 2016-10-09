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
{
    BOOL toHere;
}
+ (StoneSingleton*)shareSingletonObject;
@property(strong,nonatomic) NSString *stoneName;
@property(strong,nonatomic) NSString *stoneKey;
@property(strong,nonatomic) GMSMarker *stoneMarker;
@property(nonatomic) Boolean toHere;

@property(strong,nonatomic) NSMutableArray *stoneArray;
@property(strong,nonatomic) NSMutableDictionary *carArray;
@property(strong,nonatomic) NSMutableArray *myCollecttion;

@end
