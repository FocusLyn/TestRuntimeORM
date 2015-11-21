//
//  NSString+stringToNSDate.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "NSString+stringToNSDate.h"

@implementation NSString (stringToNSDate)

+ (NSDate *)convertStringToNSDate:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}

@end
