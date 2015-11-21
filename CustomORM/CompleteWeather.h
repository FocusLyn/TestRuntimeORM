//
//  CompleteWeather.h
//  CustomORM
//
//  Created by 臧其龙 on 15/11/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ZQLBaseModel.h"
#import "TestWeather.h"

@interface CompleteWeather : ZQLBaseModel

@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * error_code;
@property (nonatomic, strong) TestWeather *weather;

@end
