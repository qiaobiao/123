//
//  MapViewTypeManger.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#define PI 3.1415926
#define pic  3.14159265358979324
#define ax  6378245.0
#define eex  0.00669342162296594323
static double LantitudeLongitudeDist(double lon1,double lat1,
                                     
                                     double lon2,double lat2)
{
    
    double er = 6378137; // 6378700.0f;
    
    //ave. radius = 6371.315 (someone said more accurate is 6366.707)
    
    //equatorial radius = 6378.388
    
    //nautical mile = 1.15078
    
    double radlat1 = PI*lat1/180.0f;
    
    double radlat2 = PI*lat2/180.0f;
    
    //now long.
    
    double radlong1 = PI*lon1/180.0f;
    
    double radlong2 = PI*lon2/180.0f;
    
    if( radlat1 < 0 ) radlat1 = PI/2 + fabs(radlat1);// south
    
    if( radlat1 > 0 ) radlat1 = PI/2 - fabs(radlat1);// north
    
    if( radlong1 < 0 ) radlong1 = PI*2 - fabs(radlong1);//west
    
    if( radlat2 < 0 ) radlat2 = PI/2 + fabs(radlat2);// south
    
    if( radlat2 > 0 ) radlat2 = PI/2 - fabs(radlat2);// north
    
    if( radlong2 < 0 ) radlong2 = PI*2 - fabs(radlong2);// west
    
    //spherical coordinates x=r*cos(ag)sin(at), y=r*sin(ag)*sin(at), z=r*cos(at)
    
    //zero ag is up so reverse lat
    
    double x1 = er * cos(radlong1) * sin(radlat1);
    
    double y1 = er * sin(radlong1) * sin(radlat1);
    
    double z1 = er * cos(radlat1);
    
    double x2 = er * cos(radlong2) * sin(radlat2);
    
    double y2 = er * sin(radlong2) * sin(radlat2);
    
    double z2 = er * cos(radlat2);
    
    double d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
    
    //side, side, side, law of cosines and arccos
    
    double theta = acos((er*er+er*er-d*d)/(2*er*er));
    
    double dist  = theta*er;
    
    return dist;
    
}

@interface MapViewTypeManger : NSObject
{
    NSInteger gpsCount;
}

@property(nonatomic,readwrite)SEL gpsWillSatrt;
@property(nonatomic,readwrite)SEL gpsDidSuccs;
@property(nonatomic,readwrite)SEL gpsDidFailed;
@property(assign,readwrite)id delegate;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,readwrite)BOOL needGetAddress;
@property(nonatomic,strong)NSString *failedMsg;
@property (nonatomic, strong) NSString  *city;
@property(nonatomic,assign)float latitude;
@property(nonatomic,assign)float longitude;
//校对偏差
@property(nonatomic,readwrite)NSInteger maxDeviation;

@property(nonatomic,readwrite)NSInteger coordinateSystem;
//地址查询半径，单位：米
@property(nonatomic,readwrite)NSInteger radius;
//定位次数，并取平均值
@property(nonatomic,readwrite)NSInteger needGpsCount;
//需要实现的方法
-(void)startGetGps;
-(void)startGetGpsWithCompletionHandler:(void(^)(UIView * mapViewInstance))completionHandler;
-(void)startGetAddressWithLog:(float)log lat:(float)lat;
-(void)stopUpdatingLocation;
-(void)didUpdateUserLocationLat:(float)lat log:(float)log;
//获取到位置信息
-(void)didUpdateAddress:(NSString *)address;
-(void)doGpsDidSuccs;
-(void)doGpsDidFailed;
@end
