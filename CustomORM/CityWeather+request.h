//
//  CityWeather+request.h
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "CityWeather.h"

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^FailureBlock)(id error);

@interface CityWeather (request)

+ (void)fetchWeatheWithCityCode:(NSString *)cityCode withCompletionBlock:(ReturnValueBlock)completionBlock andFailureBlock:(FailureBlock)failureBlock;

@end
