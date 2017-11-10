//
//  WbvViewController.h
//  StyduDrive
//
//  Created by tgy on 2017/11/6.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(nonatomic,copy,readonly)NSString * url;
-(instancetype)initWithUrl:(NSString *)url;
@end
