//
//  MapBaidu.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapViewTypeManger.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface MapBaidu : MapViewTypeManger<BMKMapViewDelegate,BMKGeneralDelegate>
@property(nonatomic,strong)BMKMapView *mapView;
@property(nonatomic,strong)BMKMapManager *mapManger;

@end
