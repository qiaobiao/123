//
//  MapTypeChoice.m
//  地图抽象层
//
//  Created by qiaobiao on 16/1/13.
//  Copyright © 2016年 qiaobiao. All rights reserved.
//

#import "MapTypeChoice.h"
#import "UIView+AutoLayout.h"
@implementation MapTypeChoice

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *mapMenu = [UIView new];
        mapMenu.backgroundColor = [UIColor lightGrayColor];
        mapMenu.layer.shadowColor = [UIColor blackColor].CGColor;
        mapMenu.layer.shadowOpacity = 0.8;
        mapMenu.layer.shadowOffset = CGSizeMake(0, 2);
        [self addSubview:mapMenu];
        [mapMenu autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
        [mapMenu autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [mapMenu autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [mapMenu autoSetDimension:ALDimensionHeight toSize:132];
        
        UIView *bottom = [UIView new];
        [self addSubview:bottom];
        bottom.backgroundColor = [UIColor lightGrayColor];
        bottom.alpha=0.5;
        [bottom autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:mapMenu withOffset:0];
        [bottom autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [bottom autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [bottom autoSetDimension:ALDimensionHeight toSize:[UIScreen mainScreen].bounds.size.height-132];
        
        UIButton *btnF = [UIButton new];
        [btnF setTitle:@"BAIDU" forState:UIControlStateNormal];
        [btnF setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [btnF addTarget:self action:@selector(pressBaiDu) forControlEvents:UIControlEventTouchUpInside];
        [mapMenu addSubview:btnF];
        [btnF autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [btnF autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [btnF autoSetDimensionsToSize:CGSizeMake(100, 44)];
        UIImageView *imageF = [UIImageView new];
        imageF.backgroundColor = [UIColor cyanColor];
        [mapMenu addSubview:imageF];
        [imageF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:btnF withOffset:0];
        [imageF autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [imageF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [imageF autoSetDimension:ALDimensionHeight toSize:0.5];
        UIButton *btnS = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnS setTitle:@"GAODE" forState:UIControlStateNormal];
        [btnS setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [btnS addTarget:self action:@selector(pressGaoDe) forControlEvents:UIControlEventTouchUpInside];
        [mapMenu addSubview:btnS];
        
        [btnS autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [btnS autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [btnS autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageF withOffset:0];
        [btnS autoSetDimensionsToSize:CGSizeMake(100, 44)];
        UIImageView *imageS= [UIImageView new];
        imageS.backgroundColor=[UIColor cyanColor];
        [mapMenu addSubview:imageS];
        [imageS autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:btnS withOffset:0];
        [imageS autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [imageS autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [imageS autoSetDimension:ALDimensionHeight toSize:0.5];
        
        UIButton *btnT = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnT setTitle:@"NMA" forState:UIControlStateNormal];
        [btnT setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [btnT addTarget:self action:@selector(pressNMA) forControlEvents:UIControlEventTouchUpInside];
        [mapMenu addSubview:btnT];
        [btnT autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [btnT autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [btnT autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageS withOffset:0];
        [btnT autoSetDimensionsToSize:CGSizeMake(100, 44)];
    }
    return self;
    
}
-(void)pressBaiDu
{
    if ([self.delegate respondsToSelector:@selector(pressBaiDu)]) {
        [self.delegate pressBaiDu];

    }
}
-(void)pressGaoDe
{
    if ([self.delegate respondsToSelector:@selector(pressGaoDe)]) {
        [self.delegate pressGaoDe];
    }
}
-(void)pressNMA
{
    if ([self.delegate respondsToSelector:@selector(pressNMA)]) {
        [self.delegate pressNMA];
    }
}
@end
