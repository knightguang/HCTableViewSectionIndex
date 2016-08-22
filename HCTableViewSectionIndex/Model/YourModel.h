//
//  YourModel.h
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import "JSONModel.h"
#import "NSString+Spell.h"

@interface YourModel : JSONModel

/**
 *  将NSString转成拼音
 */
@property (nonatomic,strong) NSString *name;

/**
 *  首字母的拼写，移动端生成，不需要服务器传入，且不会在model中显示
 *  Ignore 隐式存在
 *  必须设置!!!!!
 */
@property (nonatomic,strong) NSString<Ignore>* pinyin;

/**
 *  yourModel的其他属性
 */
@property (nonatomic,strong) NSString<Optional>* other;


// 解析json数据
- (instancetype)initWithDic:(NSDictionary *)dic;


@end
