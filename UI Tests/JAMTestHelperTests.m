//
//  JAMTestHelperUITests.m
//  JAMTestHelperUITests
//
//  Created by Joe Masilotti on 7/2/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "XCTestCase+JAMTestHelpers.h"

@interface JAMTestHelperTests : XCTestCase
@property (nonatomic) XCUIApplication *app;
@end

@implementation JAMTestHelperTests

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
}

- (void)testWaitForElementToExist {
    XCUIElement *helloLabel = self.app.staticTexts[@"Hello, world!"];
    XCTAssertFalse(helloLabel.exists);

    [self waitForElementToExist:helloLabel];
    XCTAssert(helloLabel.exists);
}

- (void)testWaitForElementToExistTimeOut {
    XCUIElement *nonexistentLabel = self.app.staticTexts[@"Nonexistent label."];
    XCTAssertThrowsSpecificNamed([self waitForElementToExist:nonexistentLabel], NSException, JAMTimeoutException);
}

@end
