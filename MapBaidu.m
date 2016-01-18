//
//  MapBaidu.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapBaidu.h"

@implementation MapBaidu
-(id)init
{
    if (self = [super init]) {
        // 要使用百度地图，请先启动BaiduMapManager
        self.mapManger = [[BMKMapManager alloc]init];
        BOOL ret = [self.mapManger start:@"please enter your key" generalDelegate:self];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
        
    }
    return self;
}
-(void)startGetGps
{
    NSLog(@"百度地图显示");
}
-(void)startGetGpsWithCompletionHandler:(void(^)(UIView * mapViewInstance))completionHandler
{
    
    if (completionHandler) {
        self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
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
