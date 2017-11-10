//
//  AnswerScrollView.h
//  StyduDrive
//
//  Created by tgy on 2017/11/6.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView
@property (nonatomic,assign,readonly)int currentPage;
- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;

@end
