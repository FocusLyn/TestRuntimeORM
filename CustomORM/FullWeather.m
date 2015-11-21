//
//  FullWeather.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/20.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "FullWeather.h"

@implementation FullWeather

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[CityWeather class]];
}

@end
