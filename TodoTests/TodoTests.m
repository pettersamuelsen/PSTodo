//
//  TodoTests.m
//  TodoTests
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

@import XCTest;
#import "PSCoreDataManager.h"
#import "PSEntry+CoreDataAdditions.h"
#import "UITextField+Validation.h"

@interface TodoTests : XCTestCase
@property (nonatomic, strong) UITextField *textField;
@end

@implementation TodoTests

- (void)setUp {
    [super setUp];
    self.textField = [[UITextField alloc] init];
}

- (void)tearDown {
    self.textField = nil;
    [super tearDown];
}

- (void)testCreateNewEntry {
    PSEntry *entry = [PSEntry createWithTitle:@"Foo"];
    XCTAssertEqual(entry.title, @"Foo", "Title should be `Foo`");
}

- (void)testToggleCompleted {
    PSEntry *entry = [PSEntry createWithTitle:@"Foo"];
    XCTAssertFalse(entry.completed.boolValue, "Completed should be `NO` by default");
    
    [entry toggleCompleted];
    XCTAssertTrue(entry.completed.boolValue, "Completed should be toggled from `NO` to `YES`");
}

- (void)testTextFieldZeroLength {
    self.textField.text = nil;
    XCTAssertFalse([self.textField isValid], "Textfield should no be valid with a zero length");
}

- (void)testTextFieldValidLength {
    self.textField.text = @"Foo";
    XCTAssertTrue([self.textField isValid], "Textfield should have a valid length");
}

@end
