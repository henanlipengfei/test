//
//  NSString+Extension.m
//  test
//
//  Created by 李鹏飞 on 2017/5/18.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
+(NSString *)stringAddWithString:(NSString *)str
{
    NSInteger count = [str integerValue];
    count++;
    NSString *addStr = [NSString stringWithFormat:@"%zd",count];
    return addStr;
}

@end
