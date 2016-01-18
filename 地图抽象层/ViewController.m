//
//  ViewController.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "ViewController.h"
#import "MapTypeChoice.h"
#import "UIView+AutoLayout.h"
#import <MapKit/MapKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <NMAKit/NMAKit.h>
#import "HGps.h"
@interface ViewController ()<MapTypeDelegate>
@property(nonatomic,strong)MapTypeChoice *mapType;
@property(nonatomic,strong)HGps *gps;
@property(nonatomic,strong)UIView *mapViewInstance;
@property(nonatomic,assign)NSInteger P;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getUI];
}

-(void)getUI
{
    self.title = @"地图抽象层";
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithTitle:@"ChoiceMapType" style:UIBarButtonItemStyleDone target:self action:@selector(choiceMapType)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
}
-(void)choiceMapType
{
    self.mapType = [MapTypeChoice new];
    self.mapType.delegate = self;
    [self.navigationController.view insertSubview:self.mapType aboveSubview:self.navigationController.navigationBar];
    [self.mapType autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeMenuView)];
    [self.mapType addGestureRecognizer:tap];
}
-(void)removeMenuView
{
    [self.mapType removeFromSuperview];
    self.mapType=nil;
}
-(void)pressBaiDu
{
    NSLog(@"baidu");
    [self.mapType removeFromSuperview];
    self.mapType=nil;
    self.P=1;
    [self getDifferentMap];
  
}
-(void)pressGaoDe
{
    NSLog(@"gaode");
    [self.mapType removeFromSuperview];
     self.mapType=nil;
    self.P=2;
    [self getDifferentMap];
}
-(void)pressNMA
{
    NSLog(@"NMA");
    [self.mapType removeFromSuperview];
    self.mapType=nil;
    self.P=3;
    [self getDifferentMap];

}
-(void)getDifferentMap
{
    self.gps = [[HGps alloc]init];
    self.gps.needGetAddress = YES;
    if (self.P==1) {
        self.gps.gpsType = @"MapBaidu";

    }else if (self.P==2)
    {
        self.gps.gpsType = @"MapGaode";
    }else if (self.P==3)
    {
        self.gps.gpsType = @"MapNma";
    }
    [self.gps startGetGpsWithCompletionHandler:^(UIView *mapViewInstance) {
        self.mapViewInstance = mapViewInstance;
        [self mapViewType];
        
    }];
    

}
-(void)mapViewType
{
    if ([self.mapViewInstance isKindOfClass:[BMKMapView class]]) {
        BMKMapView * mapView =(BMKMapView *)self.mapViewInstance;
        [self.view addSubview:mapView];
        
    }
    else if ([self.mapViewInstance isKindOfClass:[MKMapView class]]) {
        MKMapView * mapView =(MKMapView *)self.mapViewInstance;
        [self.view addSubview:mapView];
        
    }
    else if ([self.mapViewInstance isKindOfClass:[NMAMapView class]]) {
        NMAMapView * mapView =(NMAMapView *)self.mapViewInstance;
        [self.view addSubview:mapView];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
