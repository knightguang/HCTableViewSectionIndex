//
//  YourModel.m
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import "YourModel.h"

@implementation YourModel


- (void)setName:(NSString *)name
{
    if (_name != name) {
        _name = name;
        _pinyin = [_name spellPrefixForChinese];
    }
}


- (instancetype)initWithDic:(NSDictionary *)dic
{
    NSError *error = nil;
    self =  [self initWithDictionary:dic error:&error];
    return self;
}

@end
