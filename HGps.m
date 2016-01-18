//
//  HGps.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "HGps.h"
@interface HGps()
@property(nonatomic,strong)MapViewTypeManger *gpsSuper;
@end

@implementation HGps
+(id)defaultGps
{
    HGps *defaultGps;
    if(defaultGps==nil)
    {
        defaultGps=[[HGps alloc]init];
    }
    defaultGps.needGetAddress=NO;
    defaultGps.latitude=0;
    defaultGps.longitude=0;
    defaultGps.address=nil;
    defaultGps.failedMsg=nil;
    defaultGps.delegate=nil;
    defaultGps.gpsWillSatrt=nil;
    defaultGps.gpsDidSuccs=nil;
    defaultGps.gpsDidFailed=nil;
    defaultGps.gpsSuper=nil;
    return defaultGps;
}

-(id)init
{
    if (self = [super init]) {
        NSLog(@"开始了");
    }
    return self;
}

-(void)startGetGpsWithCompletionHandler:(void (^)(UIView *))completionHandler
{
    if(self.gpsSuper==nil)
    {
        //判断gps是否打开
        if(![CLLocationManager locationServicesEnabled])
        {
            [self doGpsDidFailed];
            return;
        }
        Class a=NSClassFromString(self.gpsType);
        if(a==nil)
        {
            self.failedMsg=@"No this gps type";
            [self doGpsDidFailed];
            return;
        }
        
        MapViewTypeManger *gpsSuper=[[a alloc]init];
        self.gpsSuper=gpsSuper;
        self.gpsSuper.delegate=self.delegate;
        self.gpsSuper.gpsWillSatrt=self.gpsWillSatrt;
        self.gpsSuper.gpsDidSuccs=self.gpsDidSuccs;
        self.gpsSuper.gpsDidFailed=self.gpsDidFailed;
        self.gpsSuper.radius=self.radius;
        self.gpsSuper.maxDeviation=self.maxDeviation;
        self.gpsSuper.needGpsCount=self.needGpsCount;
        self.gpsSuper.needGetAddress=self.needGetAddress;
    }
    
    [self.gpsSuper startGetGpsWithCompletionHandler:^(UIView *mapViewInstance) {
        if (completionHandler) {
            completionHandler(mapViewInstance);
        }
    }];
}


-(void)stopUpdatingLocation
{
    [self.gpsSuper stopUpdatingLocation];
}

#pragma mark 获取位置
-(void)startGetAddressWithLog:(CGFloat)log lat:(CGFloat)lat
{
    [self.gpsSuper startGetAddressWithLog:log lat:lat];
}


@end
