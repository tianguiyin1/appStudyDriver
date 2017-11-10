//
//  ViewController.m
//  StyduDrive
//
//  Created by tgy on 2017/11/4.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"
#import "FirstViewController.h"
#import "WebViewController.h"
@interface ViewController (){
  SelectView *_selectView;//点击选择车型的view
}


@end

@implementation ViewController
- (IBAction)click:(UIButton *)sender {
    switch (sender.tag) {
        case 100:{//车型选择
                [UIView animateWithDuration:0.3 animations:^{
                    _selectView.alpha = 1;
                }];
            }
            break;
        case 101:{//科目一
            [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:YES];//望navigationcontroller压入一个viewconroller
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
            
        }
            break;
        case 102:
            ;
            break;
        case 103:
            ;
            break;
        case 104:
            ;
            break;
        case 105:{
            [self.navigationController pushViewController:[[WebViewController alloc] initWithUrl:@"http://www.jxedt.com"] animated:YES];
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        }
            break;
        case 106:
            
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _selectView = [[SelectView alloc]initWithFram:self.view.frame andBtn:_selectBtn];
    _selectView.alpha = 0;
    [self.view addSubview:_selectView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
