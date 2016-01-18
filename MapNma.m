//
//  MapNma.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapNma.h"
#import <NMAKit/NMAKit.h>

static NSString *HERECredentialAppId   = @"DT2JPFeHjCMeH7i751XJ";
static NSString *HERECredentialAppCode = @"I5tJHvldH2TBgyE29pK8JQ";
static NSString *HERECredentialLicenseKey = @"QdA1h8Lk/Gw2D/UipaZn/J8bFaFA8Yec4lQ+hNuYoefydQMcx+iycO5s6"
"4CWZyyG3LIYU9qVuILBhH2naxqdg/XXrUnANnivct+SrQODy5q5+2Ne3b"
"rYxNeLABxC0YIBdgaV8BVRdSW8Lbp7oZkBLGvKfBITgOaPPGwbYS1sGkQ"
"C2yzViw9vbjmfUe270XwyuzMxpqJ/QJGsPlhJHT4u9mEB/mKL19a1pFCE"
"IMkIuyQw2pNmBP8wm3Tdqv9Vdke7rKKOyPeXtsoo9ds8qbrHDPRoGxHGM"
"RbUgM0O8KssrrBGdT6XoXx8oBJo/kcJWrCsiRjV1P6ZN/mTSLokVdPkAe"
"CWsLsy8Zkuz6pd51ksmBmotkulWjy5hW9z7WDCfLhQgfK0S/Gz0P7QB85"
"8LnKKY2bsIQe/oAOmmcDLSQ9ZOdU6+VWNqLOvfpGxdHyy/hEzHoqnubT1"
"uUsQdx2o3vVdNl4R9itiOCvmD0PoUSzCoY4fHM8UaTAObM7sicPpa7kty"
"mRXWj9dCR9fbDJ0EZLUEQkNzk1QjXIo5WzOoWRf3Q44h9ee0SGA4KUtol"
"YFTFBcuZD03zbfFqUKF0B5F78Q9jkrL9lqyizr1KTOV3iD8X0OVmSR1P2"
"NI5Lw5m1MTgMYX3eXk+SgiChMgWzLjrNwyLS62kMbJearkNGDl0DVhSI=";
@implementation MapNma
-(id)init
{
    if (self = [super init]) {
        //诺基亚地图
        [NMAApplicationContext setAppId:HERECredentialAppId appCode:HERECredentialAppCode licenseKey:HERECredentialLicenseKey];
    }
    return self;
    
}
-(void)startGetGps
{
    NSLog(@"诺基亚地图显示");
   
}
-(void)startGetGpsWithCompletionHandler:(void(^)(UIView * mapViewInstance))completionHandler
{
    if (completionHandler) {
        self.mapView = [[NMAMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
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
