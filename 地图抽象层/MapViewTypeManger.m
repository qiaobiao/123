//
//  MapViewTypeManger.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapViewTypeManger.h"

@implementation MapViewTypeManger

-(void)didUpdateUserLocationLat:(float)lat log:(float)log
{
    gpsCount++;
    //self.latitudeTotal+=newLocation.coordinate.latitude;
    //self.longitudeTotal+=newLocation.coordinate.longitude;
    NSInteger deviation=10000000;
    
    if(gpsCount>1)
    {
        deviation=LantitudeLongitudeDist(log,lat,self.longitude,self.latitude);
    }
    self.latitude=lat;//self.latitudeTotal/gpsCount;
    self.longitude=log;//self.longitudeTotal/gpsCount;
    //此处设计为获取3次求平均值
    if(abs(deviation)<self.maxDeviation||gpsCount==self.needGpsCount)
    {
        [self stopUpdatingLocation];
        //获取地理位置信息
        if(self.needGetAddress)
        {
            [self startGetAddressWithLog:self.longitude lat:self.latitude];
        }
        else
        {
            NSLog(@"...............gps");
            [self doGpsDidSuccs];
        }
    }
}

-(void)didUpdateAddress:(NSString *)address
{
    self.address=address;
    if([self.address length]>0)
    {
        [self doGpsDidSuccs];
        
    }
    else
    {
        [self doGpsDidFailed];
        
    }
    
}

-(void)doGpsDidSuccs
{
    if([self.delegate respondsToSelector:self.gpsDidSuccs])
    {
        [self.delegate gpsDidSuccs];
    }
    self.delegate=nil;
}

-(void)doGpsDidFailed
{
    if([self.delegate respondsToSelector:self.gpsDidFailed])
    {
        [self.delegate gpsDidFailed];
    }
    self.delegate=nil;
    
    
}

//子类实现
-(void)startGetAddressWithLog:(float)log lat:(float)lat
{
    
}
-(void)startGetGps
{
    
}
-(void)stopUpdatingLocation
{
    
}
-(void)startGetGpsWithCompletionHandler:(void(^)(UIView * mapViewInstance))completionHandler
{
    
}
@end
