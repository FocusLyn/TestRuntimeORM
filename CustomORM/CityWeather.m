//
//  CityWeather.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "CityWeather.h"
#import "NSString+stringToNSDate.h"
#import <objc/runtime.h>

@implementation CityWeather

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"cityCode": @"city_code",
             @"postCode": @"post_code",
             @"highTemp": @"high_temp",
             @"lowTemp": @"low_temp",
             @"windDirection": @"wind_direction",
             @"windPower": @"wind_power"
             };
}

+ (void)printAllIvars
{
    
}

+ (void)printAllProperty
{
    Class weatherClass = [self class];
    unsigned int propertCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(weatherClass, &propertCount);
    
    for (int i = 0; i < propertCount; i++) {
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        NSLog(@"propertyName is %@",propertyName);
        
    }
}


@end
