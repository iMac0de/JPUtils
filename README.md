JPUtils
=======

JPUtils is a little helper for your iOS apps. Few useful functions like test of email string, prepare an image to upload or create quickly a UIAlertView

How to use it ?
===============

JPUtils is very easy to use.

In your code, import the JPRequest.h file and use it like it :

``` Objective-c

-(void)yourFunctionName {
  //Check an email string example
  if ([JPUtils checkStringIsEmail:@"example@example.com"]) {
    NSLog(@"The string is an email");
  } else {
    NSLog(@"The string is not an email");
  }

  //Prepare an image to upload
  NSString *base64Image = [JPUtils prepareImageToUpload:[UIImage imageNamed:@"image.png"]];
  //Then send your base64Image string to your server with JPRequest library for example
  
  //Create a quickly UIAlertView
  [JPUtils createAlertViewWithTitle:@"JPUtils" andMessage:@"It's a so cool helper!" andButton:@"Yeah!"];
}
```
