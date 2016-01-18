//
//  MapGaode.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapGaode.h"

@interface MapGaode()

@end
@implementation MapGaode
-(id)init
{
    if (self = [super init]) {
        NSLog(@"高德初始化");
    }
    return self;
}
-(void)startGetGpsWithCompletionHandler:(void(^)(UIView * mapViewInstance))completionHandler
{
    NSLog(@"高德地图显示");
    if (completionHandler) {
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        completionHandler(self.mapView);
       
    }
}
-(void)startGetAddressWithLog:(float)log lat:(float)lat
{
    
}
-(void)stopUpdatingLocation
{
    
}
@end
