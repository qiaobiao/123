//
//  GaodeMapView.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface GaodeMapView : MKMapView
+ (GaodeMapView *)sharedMapView;
@end
