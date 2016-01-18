//
//  MapGaode.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapViewTypeManger.h"

@interface MapGaode : MapViewTypeManger<MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,strong)MKMapView *mapView;

@end
