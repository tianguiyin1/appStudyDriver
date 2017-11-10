//
//  WbvViewController.m
//  StyduDrive
//
//  Created by tgy on 2017/11/6.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController (){
    UIWebView * _webView;
}

@end

@implementation WebViewController

-(instancetype)initWithUrl:(NSString *)url{
    self = [super init];
    if (self) {
        _url = url;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * nsurl = [NSURL URLWithString:_url];
    NSURLRequest * request = [NSURLRequest requestWithURL:nsurl];
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
