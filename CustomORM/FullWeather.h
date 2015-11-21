//
//  FullWeather.h
//  CustomORM
//
//  Created by 臧其龙 on 15/11/20.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "CityWeather.h"

@interface FullWeather : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * error_code;
@property (nonatomic, strong) CityWeather *data;

@end
