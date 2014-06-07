//
//  JPUtils.m
//
//  Created by Jeremy Peltier on 07/06/2014.
//  Copyright (c) 2014 Jeremy Peltier. All rights reserved.
//

#import "JPUtils.h"

@implementation JPUtils

-(id)init{
    self = [super init];
    if (self){
        // do something
    }
    return self;
}

+(JPUtils *)singleton{
    static JPUtils *singleton;
    
    if (singleton == nil){
        singleton = [[JPUtils alloc] init];
    }
    return singleton;
}

#pragma mark - CHECK EMAIL

+(BOOL)checkStringIsEmail:(NSString *)string{
    return [[JPUtils singleton] checkStringIsEmail:string];
}

-(BOOL)checkStringIsEmail:(NSString *)string{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:string];
}

#pragma mark - PREPARE IMAGE TO UPLOAD ON A WEBSERVICE

+(NSString *)prepareImageToUpload:(UIImage *)image{
    return [[JPUtils singleton] prepareImageToUpload:image];
}

-(NSString *)prepareImageToUpload:(UIImage *)image{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8f);
    NSString *imageString = [imageData base64Encoding];
    return imageString;
}

#pragma mark - CREATE AN ALERT VIEW QUICKLY AND EASLY

+(void)createAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message andButton:(NSString *)button{
    [[JPUtils singleton] createAlertViewWithTitle:title andMessage:message andButton:button];
}

-(void)createAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message andButton:(NSString *)button{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:button
                                          otherButtonTitles:nil,
                          nil];
    [alert show];
}

@end