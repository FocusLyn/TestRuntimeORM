//
//  TestWeather.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "TestWeather.h"

@implementation TestWeather

+ (NSDictionary *)CustomMapKeyDict
{
    return @{@"cityCode": @"city_code",
             @"postCode": @"post_code",
             @"highTemp": @"high_temp",
             @"lowTemp": @"low_temp",
             @"windDirection": @"wind_direction",
             @"windPower": @"wind_power"
             };
}

@end
