//
//  SpellDataHelper.m
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import "SpellDataHelper.h"

@implementation SpellDataHelper

+ (NSMutableArray *)getSortListByDataSource:(NSMutableArray *)array
{
    NSMutableArray *ans = [[NSMutableArray alloc] init];
    
    NSArray *serializeArray = [(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        //排序
        int i;
        NSString *strA = ((YourModel *)obj1).pinyin;
        NSString *strB = ((YourModel *)obj2).pinyin;
        
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;//上升
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;//下降
            }
        }
        
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }else{
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    char lastC = '1';
    NSMutableArray *data;
    NSMutableArray *oth = [[NSMutableArray alloc] init];
    for (YourModel *model in serializeArray) {
        char c = [model.pinyin characterAtIndex:0];
        if (!isalpha(c)) {
            [oth addObject:model];
        }
        else if (c != lastC){
            lastC = c;
            if (data && data.count > 0) {
                [ans addObject:data];
            }
            
            data = [[NSMutableArray alloc] init];
            [data addObject:model];
        }
        else {
            [data addObject:model];
        }
    }
    if (data && data.count > 0) {
        [ans addObject:data];
    }
    if (oth.count > 0) {
        [ans addObject:oth];
    }
    return ans;
}

+ (NSMutableArray *)getDataSourceSectionBy:(NSMutableArray *)array
{
    NSMutableArray *section = [[NSMutableArray alloc] init];
    
    // 🔍
    [section addObject:UITableViewIndexSearch];
    
    // 根据json格式 相应变换解析形式
    for (NSArray *item in array) {
        
        YourModel *model = [item objectAtIndex:0];
        
        // 拿到每一个model的首字母
        char c = [model.pinyin characterAtIndex:0];
        
        // 判断字符c是否为英文字母
        if (!isalpha(c)) {
            c = '#';
        }
        
        // toupper(c) --> 将字符c转换为大写英文字母
        [section addObject:[NSString stringWithFormat:@"%c", toupper(c)]];
    }
    return section;
}





@end
