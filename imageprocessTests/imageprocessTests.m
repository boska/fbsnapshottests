//
//  imageprocessTests.m
//  imageprocessTests
//
//  Created by yuchen on 2/15/16.
//  Copyright © 2016 commandp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FBSnapShotTestCase.h"
@interface imageprocessTests : FBSnapshotTestCase

@end

@implementation imageprocessTests

- (void)setUp {
    [super setUp];
    //self.recordMode = YES;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testBetterCrop{
    CGRect rect = CGRectMake(0,0, 3950, 3950);
    UIImage *image = [imageprocessTests imageWithColor:[UIColor redColor]];
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *cropImage = [UIImage imageWithCGImage:imageRef];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cropImage];
    FBSnapshotVerifyView(imageView, nil);
    CGImageRelease(imageRef);
}
- (void)testCrop {
    CGRect rect = CGRectMake(0,0, 3950, 3950);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *img = [imageprocessTests imageWithColor:[UIColor redColor]];
    // translated rectangle for drawing sub image
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, img.size.width, img.size.height);
    
    // clip to the bounds of the image context
    // not strictly necessary as it will get clipped anyway?
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    // draw image
    [img drawInRect:drawRect];
    
    // grab image
    UIImage *subImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *imageView = [[UIImageView alloc] initWithImage:subImage];
    FBSnapshotVerifyView(imageView, nil);

    UIGraphicsEndImageContext();

}
- (void)testExample {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    FBSnapshotVerifyView(view, nil);
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 4000.0f, 4000.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
