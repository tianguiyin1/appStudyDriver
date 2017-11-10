//
//  AnswerScrollView.m
//  StyduDrive
//
//  Created by tgy on 2017/11/6.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#define SIZE self.frame.size

@interface AnswerScrollView()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    
}

@end
@implementation AnswerScrollView{
    UIScrollView * _scrollView;
    UITableView * _leftTableView;
    UITableView * _mainTableView;
    UITableView * _rightTableView;
    NSArray * _dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if(self){
        _dataArray = [NSArray arrayWithArray:array];
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _leftTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _mainTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _rightTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _scrollView.delegate = self;
        _leftTableView.delegate = self;
        _mainTableView.delegate = self;
        _rightTableView.delegate = self;
        _leftTableView.dataSource = self;
        _mainTableView.dataSource = self;
        _rightTableView.dataSource = self;
        _scrollView.scrollEnabled=YES;
        _scrollView.bounces = NO;
        if(_dataArray.count > 1){
            _scrollView.contentSize = CGSizeMake(SIZE.width * 2, 0);
        }
        [self createView];
    }
    return self;
}

-(void)createView{
    _leftTableView.frame = CGRectMake(0, 0, SIZE.width, SIZE.height);
    _mainTableView.frame = CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
    _rightTableView.frame = CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_mainTableView];
    [_scrollView addSubview:_rightTableView];
    [self addSubview:_scrollView];
}

#pragma mark -tabview deletate function
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, 100)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"AnswerTableViewCell";
    AnswerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellId owner:self options:nil] lastObject];
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius = 10;
    }
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%c",(char)('A' + indexPath.row)];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint currentOffSet = _scrollView.contentOffset;
    int page = (int)currentOffSet.x / SIZE.width;
    if(page < _dataArray.count - 1){
        _scrollView.contentSize = CGSizeMake(currentOffSet.x + SIZE.width * 2, 0);
        _mainTableView.frame = CGRectMake(currentOffSet.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame = CGRectMake(currentOffSet.x - SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTableView.frame = CGRectMake(currentOffSet.x + SIZE.width, 0, SIZE.width, SIZE.height);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
