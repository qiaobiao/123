//
//  NmaMapView.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "NmaMapView.h"

@implementation NmaMapView
+ (NMAMapView *)sharedMapView
{
    static NMAMapView *nmaMapView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if(!nmaMapView)
        {
            nmaMapView = [NMAMapView new];
        }
    });
    
    return nmaMapView;
}
@end
