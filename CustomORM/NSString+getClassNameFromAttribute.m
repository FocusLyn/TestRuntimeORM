//
//  NSString+getClassNameFromAttribute.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/21.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "NSString+getClassNameFromAttribute.h"

@implementation NSString (getClassNameFromAttribute)

- (NSString *)getClassNameFromAttribute
{
    
    const char *attribute = self.UTF8String;
    int next = 0;
    int startIndex = 0;
    int endIndex = 0;
    while (attribute[next]!='\0') {
       // NSLog(@"attribute char is %c", attribute[next]);
        if (attribute[next] == '"') {
            if (startIndex == 0) {
                startIndex = next;
            }else
            {
                endIndex = next;
                break;
            }
            
        }
        next++;
    }
    
    NSString *subString = [self substringWithRange:NSMakeRange(startIndex + 1, endIndex - startIndex-1)];
    NSLog(@"substring is %@",subString);
    return subString;
}

@end
