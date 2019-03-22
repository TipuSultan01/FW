//
//  BaseViewController.h
//  FieldWork
//
//  Created by Samir Khatri on 10/11/13.
//
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
@interface BaseViewController : UIViewController
- (NSString *)uitableViewDiscloserButton;



@end