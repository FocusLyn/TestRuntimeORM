//
//  CityWeather+request.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "CityWeather+request.h"
#import "AFHTTPRequestOperationManager.h"

static NSString * const kWeatherURL = @"http://a.apix.cn/apixlife/weather/weather?cityid=";
static NSString * const kApiValue = @"0b774c222f7a4980666cc2d6b10980ba";
static NSString * const kApiKey = @"apix-key";

@implementation CityWeather (request)

+ (void)fetchWeatheWithCityCode:(NSString *)cityCode withCompletionBlock:(ReturnValueBlock)completionBlock andFailureBlock:(FailureBlock)failureBlock
{
    NSString *completeURLString = [NSString stringWithFormat:@"%@%@", kWeatherURL, cityCode];
    
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:kApiValue forHTTPHeaderField:kApiKey];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:completeURLString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        completionBlock(responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end
