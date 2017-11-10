//
//  FirstViewController.m
//  StyduDrive
//
//  Created by tgy on 2017/11/5.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestSelectTableViewCell.h"
#import "TestSelectViewController.h"
#import "MyDataManager.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView * _tableView;
    NSArray  * _dataArray;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;//设置坐标起始点不从屏幕坐上角开始，从rootviewcontroller的有效显示范围开始
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableView];
    [self createView];
    self.navigationItem.title = @"科目一：理论考试";
    _dataArray = @[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考"];
    
}

- (void)createView{//创建下面部分视图
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, self.view.frame.size.height-64-140, 300, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"-----------我的考试分析------------";
    [self.view addSubview: label];
    NSArray * texts = @[@"我的错题",@"我的收藏",@"我的练习",@"练习统计"];
    for(int i=0;i<4;i++){
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4*i + self.view.frame.size.width/4/2 - 30, self.view.frame.size.height - 64 - 100, 60, 60)];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+12]] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4*i + self.view.frame.size.width/4/2 - 30, self.view.frame.size.height - 64 - 35, 60, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:13];
        label.text = texts[i];
        [self.view addSubview:label];
    }
    
}

- (void)createTableView{//创建tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"FirstTableViewCell";
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellId owner:self options:nil] lastObject];
    }
    cell.myImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row + 7]];
    cell.myLabel.text = _dataArray[indexPath.row];
    return cell;
}

//点击每行的跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{//章节练习
            TestSelectViewController * con = [[TestSelectViewController alloc] init];
            NSArray * arr = [MyDataManager getData:chapter];
            con.dataArray = arr;
            con.myTitle = @"章节练习";
            UIBarButtonItem * item = [[UIBarButtonItem alloc] init];
            item.title = @"";
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
        }
        break;
            
        default:
            break;
    }
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
