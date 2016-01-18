//
//  MapTypeChoice.h
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MapTypeDelegate <NSObject>
-(void)pressBaiDu;
-(void)pressGaoDe;
-(void)pressNMA;
@end

@interface MapTypeChoice : UIView
@property(nonatomic,weak)id<MapTypeDelegate>delegate;

@end
