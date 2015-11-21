//
//  TestWeather.h
//  CustomORM
//
//  Created by 臧其龙 on 15/11/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ZQLBaseModel.h"

@interface TestWeather : ZQLBaseModel

@property (nonatomic, copy, readonly) NSString * city;
@property (nonatomic, copy, readonly) NSString * cityCode;
@property (nonatomic, copy, readonly) NSString * highTemp;
@property (nonatomic, copy, readonly) NSString * lowTemp;
@property (nonatomic, copy, readonly) NSString * postCode;
@property (nonatomic, copy, readonly) NSString * temp;
@property (nonatomic, copy, readonly) NSString * time;
@property (nonatomic, copy, readonly) NSString * weather;
@property (nonatomic, copy, readonly) NSString * windDirection;
@property (nonatomic, copy, readonly) NSString * windPower;

@end
