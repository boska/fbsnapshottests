//
//  AppDelegate.m
//  imageprocess
//
//  Created by yuchen on 2/15/16.
//  Copyright © 2016 commandp. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect rect = CGRectMake(0,0, 7950, 7950);
    UIImage *image = [self imageWithColor:[UIColor redColor]];
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *cropImage = [UIImage imageWithCGImage:imageRef];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cropImage];
    
    
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIImage *img = [self imageWithColor:[UIColor redColor]];
//    // translated rectangle for drawing sub image
//    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, img.size.width, img.size.height);
//    
//    // clip to the bounds of the image context
//    // not strictly necessary as it will get clipped anyway?
//    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
//    
//    // draw image
//    [img drawInRect:drawRect];
//    
//    // grab image
//    UIImage *subImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:subImage];
//    UIGraphicsEndImageContext();

    [self.window.rootViewController.view addSubview:imageView];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 8000.0, 8000.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
