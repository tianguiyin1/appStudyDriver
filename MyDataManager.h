//
//  MyDataManager.h
//  StyduDrive
//
//  Created by tgy on 2017/11/5.
//  Copyright © 2017年 tgy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    chapter
}DataType;
@interface MyDataManager : NSObject

+ (NSArray *)getData:(DataType)type;

@end
