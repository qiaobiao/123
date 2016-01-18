//
//  HGps.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapViewTypeManger.h"
@interface HGps : MapViewTypeManger
{
    NSString *defaultGpsType;
}
@property(nonatomic,readwrite)NSInteger coordinateType;
//接入地图类型
@property(nonatomic,strong)NSString *gpsType;

+(id)defaultGps;
-(void)startGetGps;
-(void)startGetAddressWithLog:(CGFloat)log lat:(CGFloat)lat;
-(void)stopUpdatingLocation;
+ (CLLocationCoordinate2D )transformToMars:(CLLocationCoordinate2D )location;
@end
