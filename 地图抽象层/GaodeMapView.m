//
//  GaodeMapView.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "GaodeMapView.h"

@implementation GaodeMapView
+ (GaodeMapView *)sharedMapView
{
    static GaodeMapView *gaoDeMapView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if(!gaoDeMapView)
        {
            gaoDeMapView = [GaodeMapView new];
        }
    });
    
    return gaoDeMapView;
}

@end
