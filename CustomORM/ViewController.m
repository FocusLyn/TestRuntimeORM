//
//  ViewController.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "CityWeather+request.h"
#import "Mantle.h"
#import "TestWeather.h"
#import "CompleteWeather.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CityWeather fetchWeatheWithCityCode:@"101010100" withCompletionBlock:^(id returnValue) {
        NSError *error = nil;
//        CityWeather *weather = [MTLJSONAdapter modelOfClass:[CityWeather class] fromJSONDictionary:returnValue[@"data"] error:&error];
        
//        TestWeather *weather = [[TestWeather alloc] initWithDictionary:returnValue[@"data"]];
        CompleteWeather *weather = [[CompleteWeather alloc] modelFromJSONDictionary:returnValue];
        NSLog(@"weather data is %@", weather.weather.postCode);
        dispatch_async(dispatch_get_main_queue(), ^{
           // NSLog(@"weather name is %@, error is %@", weather.cityCode, error);
         
        });
    } andFailureBlock:^(id error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
