//
//  SpellDataHelper.h
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  please remenber #import "yourModel.h"
 */
#import "YourModel.h"


/**
 *  格式化拼写的首字母
 */

@interface SpellDataHelper : NSObject

/**
 *  根据传入的数据源，格式化（非26个字母）按A~Z顺序排列
 *
 *  @param array 数据源
 *
 *  @return dataArray
 */
+ (NSMutableArray *)getSortListByDataSource:(NSMutableArray *)array;


/**
 *  根据数据源拼音的首字母，排序，得到字母集合（A~Z ; #123...）
 *
 *  @param array 已经按一定顺序格式化了的数据源
 *
 *  @return @[🔍 A~Z #123...]
 */
+ (NSMutableArray *)getDataSourceSectionBy:(NSMutableArray *)array;




@end
