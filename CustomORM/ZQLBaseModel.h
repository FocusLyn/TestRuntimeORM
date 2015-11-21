//
//  ZQLBaseModel.h
//  CustomORM
//
//  Created by 臧其龙 on 15/11/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQLBaseModel : NSObject

+ (NSSet *)getBaseModelPropertyKeys;

+ (NSDictionary *)CustomMapKeyDict;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSSet *)getMethodList;

- (id)modelFromJSONDictionary:(NSDictionary *)jsonDict;

@end
