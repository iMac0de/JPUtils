//
//  JPUtils.m
//
//  Created by Jeremy Peltier on 07/06/2014.
//  Copyright (c) 2014 Jeremy Peltier. All rights reserved.
//

#import "JPUtils.h"

@implementation JPUtils

#pragma mark - CHECK EMAIL

+(BOOL)checkStringIsEmail:(NSString *)string{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:string];
}

#pragma mark - PREPARE IMAGE TO UPLOAD ON A WEBSERVICE

+(NSString *)prepareImageToUpload:(UIImage *)image{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8f);
    NSString *imageString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return imageString;
}

#pragma mark - CREATE AN ALERT VIEW QUICKLY AND EASLY

+(void)createAlertViewWithTitle:(UIViewController *)parentController :(NSString *)title andMessage:(NSString *)message andButton:(NSString *)button{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:button style:UIAlertActionStyleCancel handler:nil]];
    [parentController presentViewController:alertController animated:true completion:nil];
}

@end
