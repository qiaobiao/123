//
//  MapNma.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapViewTypeManger.h"
#import <NMAKit/NMAKit.h>
@interface MapNma : MapViewTypeManger
@property(nonatomic,strong)NMAMapView *mapView;

@end
