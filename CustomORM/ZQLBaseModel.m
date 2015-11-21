//
//  ZQLBaseModel.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/19.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ZQLBaseModel.h"
#import <objc/runtime.h>
#import "NSString+getClassNameFromAttribute.h"

@interface ZQLBaseModel ()
{
    NSDictionary *_customMapKeyDict;
    
    NSDictionary *_jsonDictionary;
}
@end

@implementation ZQLBaseModel

+ (NSSet *)getBaseModelPropertyKeys
{
    NSMutableSet *keySet = [NSMutableSet set];
    
    unsigned int propertyCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    
    for (int i = 0; i<propertyCount; i++) {
        objc_property_t property = propertyList[i];
        
        [keySet addObject:@(property_getName(property))];
        
        // NSLog(@"attribute is %@", @(property_getAttributes(property)));
    }
    
   
    
    return keySet;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _jsonDictionary = dict;
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    _customMapKeyDict = [[self class] CustomMapKeyDict];
    for (NSString *modelKey in _customMapKeyDict.allKeys) {
       
        if ([_customMapKeyDict[modelKey] isEqualToString:key]) {
           
            [self setValue:_jsonDictionary[key] forKey:modelKey];
        }
    }
    
}

- (id)modelFromJSONDictionary:(NSDictionary *)jsonDict
{
   // id model = [[[self class] alloc] init];
    NSSet *propertySet = [[self class] getBaseModelPropertyKeys];
    NSDictionary *transformNameDict = [[self class] CustomMapKeyDict];
    for (NSString *propertyName in propertySet) {
        NSString *realName = nil;
        if (!transformNameDict[propertyName]) {
            realName = propertyName;
        }else
        {
            realName = transformNameDict[propertyName];
        }
        
        id value = jsonDict[realName];
        
        [self setValue:value forKey:propertyName];
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSString *attribute = @(property_getAttributes(class_getProperty([self
                                                                            class], propertyName.UTF8String)));
           NSString *className = [attribute getClassNameFromAttribute];
            Class modelClass = NSClassFromString(className);
            if ([modelClass isSubclassOfClass:[ZQLBaseModel class]]) {
                
                id model = [[modelClass alloc] modelFromJSONDictionary:value];
                [self setValue:model forKey:propertyName];
            }
            
        }
    }
    return self;
}



//- (id)modelFromJSONDictionary:(NSDictionary *)JSONDictionary error:(NSError **)error {
//    if ([self.modelClass respondsToSelector:@selector(classForParsingJSONDictionary:)]) {
//        Class class = [self.modelClass classForParsingJSONDictionary:JSONDictionary];
//        if (class == nil) {
//            if (error != NULL) {
//                NSDictionary *userInfo = @{
//                                           NSLocalizedDescriptionKey: NSLocalizedString(@"Could not parse JSON", @""),
//                                           NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"No model class could be found to parse the JSON dictionary.", @"")
//                                           };
//                
//                *error = [NSError errorWithDomain:MTLJSONAdapterErrorDomain code:MTLJSONAdapterErrorNoClassFound userInfo:userInfo];
//            }
//            
//            return nil;
//        }
//        
//        if (class != self.modelClass) {
//            NSAssert([class conformsToProtocol:@protocol(MTLJSONSerializing)], @"Class %@ returned from +classForParsingJSONDictionary: does not conform to <MTLJSONSerializing>", class);
//            
//            MTLJSONAdapter *otherAdapter = [self JSONAdapterForModelClass:class error:error];
//            
//            return [otherAdapter modelFromJSONDictionary:JSONDictionary error:error];
//        }
//    }
//    
//    NSMutableDictionary *dictionaryValue = [[NSMutableDictionary alloc] initWithCapacity:JSONDictionary.count];
//    
//    for (NSString *propertyKey in [self.modelClass propertyKeys]) {
//        id JSONKeyPaths = self.JSONKeyPathsByPropertyKey[propertyKey];
//        
//        if (JSONKeyPaths == nil) continue;
//        
//        id value;
//        
//        if ([JSONKeyPaths isKindOfClass:NSArray.class]) {
//            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//            
//            for (NSString *keyPath in JSONKeyPaths) {
//                BOOL success = NO;
//                id value = [JSONDictionary mtl_valueForJSONKeyPath:keyPath success:&success error:error];
//                
//                if (!success) return nil;
//                
//                if (value != nil) dictionary[keyPath] = value;
//            }
//            
//            value = dictionary;
//        } else {
//            BOOL success = NO;
//            value = [JSONDictionary mtl_valueForJSONKeyPath:JSONKeyPaths success:&success error:error];
//            
//            if (!success) return nil;
//        }
//        
//        if (value == nil) continue;
//        
//        @try {
//            NSValueTransformer *transformer = self.valueTransformersByPropertyKey[propertyKey];
//            if (transformer != nil) {
//                // Map NSNull -> nil for the transformer, and then back for the
//                // dictionary we're going to insert into.
//                if ([value isEqual:NSNull.null]) value = nil;
//                
//                if ([transformer respondsToSelector:@selector(transformedValue:success:error:)]) {
//                    id<MTLTransformerErrorHandling> errorHandlingTransformer = (id)transformer;
//                    
//                    BOOL success = YES;
//                    value = [errorHandlingTransformer transformedValue:value success:&success error:error];
//                    
//                    if (!success) return nil;
//                } else {
//                    value = [transformer transformedValue:value];
//                }
//                
//                if (value == nil) value = NSNull.null;
//            }
//            
//            dictionaryValue[propertyKey] = value;
//        } @catch (NSException *ex) {
//            NSLog(@"*** Caught exception %@ parsing JSON key path \"%@\" from: %@", ex, JSONKeyPaths, JSONDictionary);
//            
//            // Fail fast in Debug builds.
//#if DEBUG
//            @throw ex;
//#else
//            if (error != NULL) {
//                NSDictionary *userInfo = @{
//                                           NSLocalizedDescriptionKey: ex.description,
//                                           NSLocalizedFailureReasonErrorKey: ex.reason,
//                                           MTLJSONAdapterThrownExceptionErrorKey: ex
//                                           };
//                
//                *error = [NSError errorWithDomain:MTLJSONAdapterErrorDomain code:MTLJSONAdapterErrorExceptionThrown userInfo:userInfo];
//            }
//            
//            return nil;
//#endif
//        }
//    }
//    
//    id model = [self.modelClass modelWithDictionary:dictionaryValue error:error];
//    
//    return [model validate:error] ? model : nil;
//}

+ (NSDictionary *)CustomMapKeyDict
{
    return @{};
}

+ (NSSet *)getMethodList
{
    NSMutableSet *methodSet = [NSMutableSet set];
    
    unsigned int methodCount = 0;
    
    Method *methodList = class_copyMethodList([self class], &methodCount);
    
    for (int i = 0; i<methodCount; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        NSLog(@"method name is %@", @(sel_getName(sel)));
        [methodSet addObject:@(sel_getName(sel))];
    }
    
    return methodSet;
}

@end
