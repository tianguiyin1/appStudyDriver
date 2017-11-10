//
//  AnswerTableViewCell.h
//  StyduDrive
//
//  Created by tgy on 2017/11/6.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *numberImage;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
