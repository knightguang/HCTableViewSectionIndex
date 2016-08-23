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
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    // 1.对传入的数组排序
    NSArray *serializeArray = [(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        // 取出数组中的两个元素进行比较并排序
        int i;
        NSString *strA = ((YourModel *)obj1).pinyin;
        NSString *strB = ((YourModel *)obj2).pinyin;
        
        // 判断 两个 string 首字母的大小，并将其排序，首字母相同会判断第二个字母，类推
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;// 降序 @[b, a];
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;// 升序 @[a, b];
            }
        }
        
        // 前面所有相同字母都一样，长的排后面
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }else{
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    // 判断数字等 非字母 的 首字符
    char lastC = '1';
    NSMutableArray *data;
    NSMutableArray *otherData = [[NSMutableArray alloc] init];
    
    // 遍历排序好的数组，对相同首字母的model封装到一个dataArray里面
    for (YourModel *model in serializeArray) {
        
        char c = [model.pinyin characterAtIndex:0];
        
        // 判断字符c是否为英文字母
        if (!isalpha(c)) {
            [otherData addObject:model];
        }
        // 如果当前model的首字母与之前的model的不一致，重新赋值char c，并存储当前model
        else if (c != lastC){
            lastC = c;
            if (data && data.count > 0) {
                [resultArray addObject:data];
            }
            
            data = [[NSMutableArray alloc] init];
            [data addObject:model];
        }
        // 如果当前model的首字母与之前的model的一致，直接添加model
        else {
            [data addObject:model];
        }
    }
    
    if (data && data.count > 0) {
        [resultArray addObject:data];
    }
    
    if (otherData.count > 0) {
        [resultArray addObject:otherData];
    }
    
    return resultArray;
}

+ (NSMutableArray *)getDataSourceSectionBy:(NSMutableArray *)array
{
    NSMutableArray *section = [[NSMutableArray alloc] init];
    
    // 🔍
    [section addObject:UITableViewIndexSearch];
    
    // 解析传入的array，该array被上一个方法封装了，结构是：array 套 array
    for (NSArray *item in array) {
        
        // 取得array的首元素：model
        YourModel *model = [item objectAtIndex:0];
        
        // 拿到model的首字母
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
