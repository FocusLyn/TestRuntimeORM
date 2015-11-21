//
//  testNSDateCategory.m
//  CustomORM
//
//  Created by 臧其龙 on 15/11/18.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+stringToNSDate.h"

@interface testNSDateCategory : XCTestCase

@end

@implementation testNSDateCategory

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testNSDateConvertTime
{
    NSString *timeStr = @"15-09-18 11:43";
    NSDate *date = [NSString convertStringToNSDate:timeStr];
    
    XCTAssertNotNil(date);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
