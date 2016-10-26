//
//  JPUtils.h
//
//  Created by Jeremy Peltier on 07/06/2014.
//  Copyright (c) 2014 Jeremy Peltier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPUtils : NSObject

+(BOOL)checkStringIsEmail:(NSString *)string;
+(NSString *)prepareImageToUpload:(UIImage *)image;
+(void)createAlertViewWithTitle:(UIViewController *)parentController :(NSString *)title andMessage:(NSString *)message andButton:(NSString *)button;

@end
