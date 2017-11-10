//
//  MyDataManager.m
//  StyduDrive
//
//  Created by tgy on 2017/11/5.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import "MyDataManager.h"
#import "FMDatabase.h"
#import "TestSelectModel.h"
@implementation MyDataManager

+ (NSArray *)getData:(DataType)type{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    static FMDatabase * dataBase;
    if(dataBase == nil){
        NSString * path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
        if([dataBase open]){
            NSLog(@"open success");
            
        }else{
            return array;
        }
    }
    
    switch (type) {
        case chapter:{
            NSString * sql = @"select pid,pname,pcount from firstlevel";
            FMResultSet * rs = [dataBase executeQuery:sql];
            while([rs next]){
                TestSelectModel * model = [[TestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
            }
        }
        
            break;
            
        default:
            break;
    }
    
    return array;
}

@end
