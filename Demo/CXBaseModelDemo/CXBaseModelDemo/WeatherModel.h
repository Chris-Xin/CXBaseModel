//
//  WeatherModel.h
//  CXBaseModelDemo
//
//  Created by Chris on 14-6-10.
//  Copyright (c) 2014年 Chris.Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXBaseModel.h"
/*
 {
    "city":"北京",
    "cityid":"101010100",
    "temp":"21",
    "WD":"东风",
    "WS":"2级",
    "SD":"73%",
    "WSE":"2",
    "time":"20:50",
    "isRadar":"1",
    "Radar":"JC_RADAR_AZ9010_JB"
 }
 */
@interface WeatherModel : CXBaseModel

@property(nonatomic, retain)NSString *city;
@property(nonatomic, retain)NSString *cityid;
@property(nonatomic, retain)NSString *temp;
@property(nonatomic, retain)NSString *WD;
@property(nonatomic, retain)NSString *WS;
@property(nonatomic, retain)NSString *WSE;
@property(nonatomic, retain)NSString *time;
@property(nonatomic, retain)NSString *isRadar;
@property(nonatomic, retain)NSString *Radar;

@end
