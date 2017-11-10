//
//  SelectView.m
//  StyduDrive
//
//  Created by tgy on 2017/11/5.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView
{
    UIButton * _button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFram:(CGRect)frame andBtn:(UIButton *)btn{
    self = [super initWithFrame:frame];
    if(self != nil){
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self createBtn];
        _button = btn;
    }
    return self;
}

-(void)createBtn{
    for(int i=0;i<4;i++){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.frame.size.width/4*i+self.frame.size.width/4/2 - 30, self.frame.size.height - 80, 60, 60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
}

//点击视图的事件，让自己消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

//每个按妞点击的事件
- (void)click:(UIButton *)btn{
    [_button setImage:[btn backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];//换按钮图片
    [UIView animateWithDuration:0.3 animations:^{//隐藏
        self.alpha = 0;
    }];

}

@end
